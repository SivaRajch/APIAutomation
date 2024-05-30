package CommonUtility.Java;

import de.redsix.pdfcompare.CompareResult;
import de.redsix.pdfcompare.CompareResultWithPageOverflow;
import de.redsix.pdfcompare.PdfComparator;
import de.redsix.pdfcompare.RenderingException;
import de.redsix.pdfcompare.env.SimpleEnvironment;
import org.apache.commons.lang3.RandomStringUtils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

public class FileOperations {

    public static boolean isFileDownloaded(String downloadPath, String fileName) {
        boolean flag = false;
        File dir = new File(downloadPath);
        System.out.println("Files location : " + dir);
        File[] dir_contents = dir.listFiles();
        for (int i = 0; i < dir_contents.length; i++) {
            if (dir_contents[i].getName().toLowerCase().contains(fileName.toLowerCase())){
                System.out.println("Files Name : " + dir_contents[i].getName());
                flag = true;
            }
        }
        return flag;
    }

    /**
     * This method will wait until the folder is having any downloads
     *
     * @throws InterruptedException
     */
    public static void waitUntilFileToDownload(String folderLocation) throws InterruptedException {
        File directory = new File(folderLocation);
        boolean downloadinFilePresence = false;
        File[] filesList = null;
        LOOP: while (true) {
            filesList = directory.listFiles();
            for (File file : filesList) {
                downloadinFilePresence = file.getName().contains(".crdownload");
            }
            if (downloadinFilePresence) {
                for (; downloadinFilePresence;) {
                    Thread.sleep(500);
                    continue LOOP;
                }
            } else {
                break;
            }
        }
    }

    public static void deleteFilesByName(String downloadPath,String fileName) {
        File dir = new File(downloadPath);
        if (dir.exists() && dir.isDirectory()) {
            File[] listFiles = dir.listFiles();
            for (File file : listFiles) {
                if (file.getName().toLowerCase().contains(fileName.toLowerCase())) {
                    System.out.println("Deleting " + file.getName());
                    file.delete();
                }
            }
        }
    }
    /**
     * @param pdfFile1
     * @param pdfFile2
     * @return
     * @throws RenderingException,IOException
     * This method will return the CompareResult object
     * Using this Object we can call isNotEqual(), isEqual(),getNumberOfPages() and writeTo("resultPdf") methods
     */
    @SuppressWarnings("rawtypes")
    public static CompareResult comparePDF(String pdfFile1,String pdfFile2) throws RenderingException, IOException {
        CompareResult result = new PdfComparator(pdfFile1, pdfFile2).compare();
        System.out.println("Number Of Pages >> " + result.getNumberOfPages());
        return result;
    }

    /**
     * @param pdfFile1
     * @param pdfFile2
     * @param resultPdf
     * @return
     * @throws RenderingException
     * @throws IOException
     * This method will return the status as true if both pdf files are matching  and false if both are not matching
     *  Also it will generate the new result pdf file if both pdf files are not matching
     */
    @SuppressWarnings("rawtypes")
    public static boolean comparesPDFAndGenerateResult(String pdfFile1, String pdfFile2, String resultPdf) throws RenderingException, IOException {
        boolean flag;
        CompareResult result = new PdfComparator(pdfFile1, pdfFile2, new CompareResultWithPageOverflow()).withEnvironment(new SimpleEnvironment()
                .setAllowedDiffInPercent(0.6)).compare();
        System.out.println("Number Of Pages >> " + result.getNumberOfPages());
        if(result.isNotEqual()) {
            System.out.println("Both Files are Not Matching... Please check the result pdf for more details");
            System.out.println("Pages With Differences >> " + result.getPagesWithDifferences());
            int index = resultPdf.lastIndexOf('/');
            String resultDir = null;
            if (index > 0) {
                System.out.println(resultPdf.substring(0,index));
                resultDir = resultPdf.substring(0, index);
            }
            File tDir = new File(resultDir);
            if (! tDir.exists()){
                tDir.mkdir();
            }
            result.writeTo(resultPdf);
            flag = false;
        } else if(result.isEqual()) {
            System.out.println("Both Files are Matching...");
            flag = true;
        } else {
            System.out.println("Unable to compare PDF files.. Please check file type manually");
            flag = false;
        }
        result = null;
        System.gc();
        return flag;
    }
    public static void waitUntilFileToDownloadPDF(String folderLocation) throws InterruptedException {
        File f = new File(folderLocation);

        long filesize1;
        long filesize2;
        do {

            filesize1 = f.length();  // check file size
            Thread.sleep(3000);      // wait for 3 seconds
            filesize2 = f.length();  // check file size again

        } while (filesize1 != filesize2);
    }

    public static String moveFileToDirectory(String sourceFile, String targetPath) {
        String random = RandomStringUtils.randomAlphabetic(16);
        File tDir = new File(targetPath);
        if (! tDir.exists()){
            tDir.mkdir();
            // If you require it to make the entire directory path including parents,
            // use directory.mkdirs(); here instead.
        }
        String target = null;
        File file = new File(sourceFile);
        String fileName = file.getName();

        String extension = null;
        int index = fileName.lastIndexOf('.');
        if (index > 0) {
            extension = fileName.substring(index);
        }
        String targetFileName = System.currentTimeMillis()+random+extension;
        target = targetPath +file.separator+targetFileName;
        file.renameTo(new File(target));
        file = null;
        System.gc();
        return targetFileName;
    }

}
