import GetBundleInfo from "./GetBundleInfo.test";
import GetAppCloneIdentityTest from "./GetAppCloneIdentity.test.ets";
import getLaunchWant from './GetLaunchWant.test.ets';
import GetLaunchWantForBundleSyncStatic from "./GetLaunchWantForBundleSyncStatic.test.ets";

export default function testsuite() {
  GetBundleInfo();
  GetAppCloneIdentityTest();
  getLaunchWant();
  GetLaunchWantForBundleSyncStatic();
}
