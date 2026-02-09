import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, UIElementInfo} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function ForEach001() {
  describe('ForEach001', () => {
    beforeEach(async (done: Function) => {
      console.info("ForEach001 setup start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Foreach/ForEach001",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (!("ForEach001" == pages.name)) {
          console.info("get ForEach001 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ForEach001 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ForEach001 page error:" + err);
      }
      console.info("ForEach001 beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ForEach001 after each called");
    });

    /**
     * @tc.name   ForEach001_001
     * @tc.number ForEach001_001
     * @tc.desc   Frequently updating and modifying the values of parent components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ForEach001_001', Level.LEVEL3, async (done: Function) => {
      console.info('[ForEach001_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('addDate'));
      await CommonFunc.sleep(1000);
      await btn.click();
      await CommonFunc.sleep(1000);
      let text_1 = await (await driver.findComponent(ON.id('arrLastStr'))).getText();
      console.info("[ForEach001_001] component text_1: " + text_1);
      expect(text_1).assertEqual('new item50');
      await CommonFunc.sleep(1000);
      console.info('[ForEach001_001] END');
      done();
    });
  })
}

