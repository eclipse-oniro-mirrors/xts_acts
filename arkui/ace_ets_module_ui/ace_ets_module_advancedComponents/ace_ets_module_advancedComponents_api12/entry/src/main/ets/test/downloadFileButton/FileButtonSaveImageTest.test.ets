import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';


export default function FileButtonSaveImageTest() {

  describe('FileButtonSaveImageTest', () => {
    beforeEach(async (done: function) => {
      console.info('FileButtonSaveImageTest beforeEach start');
      try {
        router.clear();
        let pages = router.getState();
        if (!("FileButtonSaveImage" == pages.name)) {
          await router.push({
            url: 'MainAbility/pages/downloadFileButton/FileButtonSaveImage',
          });
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonSaveImage page error: ' + err);
      }
      console.info('FileButtonSaveImageTest beforeEach end');
      done();
    });

    afterEach(async () => {
      console.info('FileButtonSaveImageTest after each called');
    })

    /**
     * @tc.number FileButtonSaveImageTest
     * @tc.name FileButtonSaveImageTest_0100
     * @tc.desc Test FileButtonSaveImageTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('FileButtonSaveImageTest_0100', 0, async (done: function) => {
      console.info('[FileButtonSaveImageTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('保存图片'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonSaveImageTest] END');
      done();
    });
  })

}