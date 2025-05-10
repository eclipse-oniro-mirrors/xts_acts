import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function FileButtonDownloadTest() {

  describe('FileButtonDownloadTest', () => {
    beforeEach(async (done: Function) => {
      console.info('FileButtonDownloadTest beforeEach start');
      try {
        router.clear();
        let pages = router.getState();
        if (!("FileButtonDownload" == pages.name)) {
          await router.push({
            url: 'MainAbility/pages/downloadFileButton/FileButtonDownload',
          });
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonDownload page error: ' + err);
      }
      console.info('FileButtonDownloadTest beforeEach end');
      done();
    });

    afterEach(async () => {
      console.info('FileButtonDownloadTest after each called');
    })

    /**
     * @tc.number FileButtonDownloadTest
     * @tc.name FileButtonDownloadTest_0100
     * @tc.desc Test FileButtonDownloadTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('FileButtonDownloadTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[FileButtonDownloadTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('下载'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonDownloadTest] END');
      done();
    });
  })
}
