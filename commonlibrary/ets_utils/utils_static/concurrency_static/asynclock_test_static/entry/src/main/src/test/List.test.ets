import arkTSUtilsLockTest from "./ArkTSUtilsLock.test";
import LockTest from "./LockTest.test";
import AsyncLockTest from "./AsyncLockTest.test";
export default function testsuite() {
  arkTSUtilsLockTest();
  LockTest();
  AsyncLockTest();
}