import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function FileButtonDownloadFileTest() {
  describe('FileButtonDownloadFileTest', () => {
    beforeEach(async (done: Function) => {
      console.info('FileButtonDownloadFileTest beforeEach start');
      try {
        router.clear();
        let pages = router.getState();
        if (!("FileButtonDownloadFile" == pages.name)) {
          await router.push({
            url: 'MainAbility/pages/downloadFileButton/FileButtonDownloadFile',
          });
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonDownloadFileTest page error: ' + err);
      }
      console.info('FileButtonDownloadFileTest beforeEach end');
      done();
    });

    afterEach(async () => {
      console.info('FileButtonDownloadFileTest after each called');
    })

    /**
     * @tc.number FileButtonDownloadFileTest
     * @tc.name FileButtonDownloadFileTest_0100
     * @tc.desc Test FileButtonDownloadFileTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('FileButtonDownloadFileTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
      console.info('[FileButtonDownloadFileTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('下载文件'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonDownloadFileTest] END');
      done();
    });
  })

}
