import cloudCloudSyncTest from './CloudSync.test';
import changeDataTest from './ChangeData.test';
import cloudFileDownloadTest from "./DownloadCloud.test";

export default function testsuite() {
    cloudCloudSyncTest();
    changeDataTest();
    cloudFileDownloadTest();
}
