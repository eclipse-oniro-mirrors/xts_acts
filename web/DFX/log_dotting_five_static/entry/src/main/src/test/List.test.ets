
import  WebDownloadEnumTest from './WebDownloadEnumTest.test'
import  WebInitTest from './WebInitTest.test'
import  webResourceError from './WebResourceError.test'
export default function testsuite() {
  WebDownloadEnumTest();
  WebInitTest();
  webResourceError();
}
