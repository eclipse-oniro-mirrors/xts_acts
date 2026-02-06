import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function FileButtonSaveFileTest() {

  describe('FileButtonSaveFileTest', () => {
    beforeEach(async (done: Function) => {
      try {
        router.clear();
        let pages = router.getState();
        if (!("FileButtonSaveFile" == pages.name)) {
          await router.push({
            url: 'MainAbility/pages/downloadFileButton/FileButtonSaveFile',
          });
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonSaveFile page error: ' + err);
      }
      console.info('FileButtonSaveFileTest beforeEach end');
      done();
    });

    afterEach(async () => {
      console.info('FileButtonSaveFileTest after each called');
    })

    /**
     * @tc.number FileButtonSaveFileTest
     * @tc.name FileButtonSaveFileTest_0100
     * @tc.desc Test FileButtonSaveFileTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('FileButtonSaveFileTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[FileButtonSaveFileTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('保存文件'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonSaveFileTest] END');
      done();
    });
  })

}