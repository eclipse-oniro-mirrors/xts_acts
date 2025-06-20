import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import { Component, Driver, On, ON, MouseButton } from '@kit.TestKit';

export default function ScrollBackToTopTest() {
  describe('ScrollBackToTopTest', () => {
    beforeEach(async (done: Function) => {
      const SUITE: string = 'ScrollBackToTop'
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/ScrollBackToTop",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("ScrollSwipe" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });
    /*
     * @tc.number :ArkUI_Scroll_BackToTop_0100
     * @tc.name   :test scroll back to top
     * @tc.desc   :test whether backToTop events are effective
     */
    it('ScrollTest1_0100', Level.LEVEL1, async () => {
      console.info('ScrollTest_0100 START');
      await sleep(1000)
      let driverScroll: Driver = Driver.create();
      let scroll: Component = await driverScroll.findComponent(ON.id('Scroll_4'));
      let rect = await scroll.getBounds();
      let top = rect.top;
      let left = rect.left;
      let right = rect.right;
      let bottom = rect.bottom;
      console.info("ScrollTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom - top;
      let width = right - left;
      // create driver
      let driverTop = await Driver.create();
      let topButton: Component = await driverTop.findComponent(ON.id('Top'));
      let driverSwitch = await Driver.create();
      let switchButton: Component = await driverSwitch.findComponent(ON.id('Switch'))
      await sleep(1000);  //wait for driver to be ready
      await driverScroll.swipe(
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 4),
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 2)
      );
      //waiting for scroll to complete
      await sleep(2000);
      await topButton.click();
      await sleep(1500)
      let stopJson = getInspectorByKey('ScrollBackToTop');
      expect(JSON.parse(stopJson).$attrs.content !== 'onDidScrollBackToTop').assertTrue();

      await switchButton.click();
      await sleep(500)
      await topButton.click();
      await sleep(1500)

      await driverScroll.swipe(
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 4),
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 2)
      );
      await sleep(2000);
      await switchButton.click();
      await sleep(500)
      await topButton.click();
      await sleep(1500)

      await driverScroll.swipe(
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 4),
        Math.round(left + width * 0.2),
        Math.round(bottom - height / 2)
      );
      await sleep(2000);
      await switchButton.click();
      await sleep(500)
      await topButton.click();
      await sleep(1000); //waiting for backToTop

      let strJson = getInspectorByKey('Scroll_1');
      let strJson1 = getInspectorByKey('Scroll_2');
      let strJson3 = getInspectorByKey('ScrollBackToTop');
      let strJson4 = getInspectorByKey('ScrollAbnormal');
      console.info("getInspectorByKey result for Scroll_1: " + strJson);
      let obj: ESObject = JSON.parse(strJson);
      console.info("getInspectorByKey result for Scroll_2: " + strJson1);
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("getInspectorByKey result for ScrollBackToTop: " + strJson3);
      let obj3: ESObject = JSON.parse(strJson3);
      let obj4: ESObject = JSON.parse(strJson4);
      // output console info
      console.info("[ScrollTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ScrollTest_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ScrollTest_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[ScrollTest_0100] component obj4 is: " + JSON.stringify(obj4));
      // assertEqual backToTop event
      expect(obj.$attrs.content).assertEqual('onWillScroll');
      expect(obj3.$attrs.content).assertEqual('onDidScrollBackToTop');
      expect(obj4.$attrs.content).assertEqual('DidAbnormal');
      console.info('[ScrollTest_0100] END');
    })
  })
}

async function sleep(time: number) {
  return new Promise((resolve: (value: string) => void, reject) => {
    setTimeout(() => {
      resolve("sleep")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}
