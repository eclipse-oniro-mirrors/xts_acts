import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function FileButtonSaveTest() {

  describe('FileButtonSaveTest', () => {
    beforeEach(async (done: Function) => {
      console.info('FileButtonSaveTest beforeEach start');
      try {
        router.clear();
        let pages = router.getState();
        if (!("FileButtonSave" == pages.name)) {
          await router.push({
            url: 'MainAbility/pages/downloadFileButton/FileButtonSave',
          });
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push FileButtonSave page error: ' + err);
      }
      console.info('FileButtonSaveTest beforeEach end');
      done();
    });

    afterEach(async () => {
      console.info('FileButtonSaveTest after each called');
    })

    /**
     * @tc.number FileButtonSaveTest
     * @tc.name FileButtonSaveTest_0100
     * @tc.desc Test FileButtonSaveTest
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('FileButtonSaveTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('[FileButtonSaveTest] START');
      let driver = await Driver.create();
      await driver.delayMs(2000);
      let title = await driver.findComponent(ON.text('保存'));
      expect(title !== null).assertTrue();
      await driver.delayMs(1000);
      console.info('[FileButtonSaveTest] END');
      done();
    });
  })

}