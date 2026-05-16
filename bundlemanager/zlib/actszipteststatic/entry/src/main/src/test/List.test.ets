import ActsZipInflateTest from "./ActsZipInflateTest.test";
import ActsZipDeflateTest from "./ActsZipDeflateTest.test";
import ActsZipInflateBackTest from "./ActsZipinflateBackTest.test"
export default function testsuite() {
  ActsZipInflateTest();
  ActsZipDeflateTest();
  ActsZipInflateBackTest();
}