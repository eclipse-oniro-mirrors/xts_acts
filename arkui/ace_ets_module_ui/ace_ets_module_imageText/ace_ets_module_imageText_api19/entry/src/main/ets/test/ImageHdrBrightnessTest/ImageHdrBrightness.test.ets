import { describe, it, expect, beforeAll, afterEach, Level } from '@ohos/hypium';
// 导入测试依赖kit
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function ImageHDRBrightnessTest() {
  describe('ImageHDRBrightnessTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageHdrBrightness/ImageHdrBrightness',
      }
      try {
        router.clear();
        let pages = router.getState();
        if (!("ImageHdrBrightness" == pages.name)) {
          let result = await router.push(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push ImageHDRBrightnessTest page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("ImageHDRBrightnessTest after each called");
    });

    it('ImageHDRBrightnessTest_001',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr00'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('hdrImageKey');
      let obj: ESObject = JSON.parse(strJson);
      let hdr: number = obj.$attrs.hdrBrightness
      console.info('hdrBrightness is: ' + obj.$attrs.hdrBrightness);
      expect(hdr.toFixed(1)).assertEqual('0.0');
      done();
    })

    it('ImageHDRBrightnessTest_002',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr03'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('hdrImageKey');
      let obj: ESObject = JSON.parse(strJson);
      let hdr: number = obj.$attrs.hdrBrightness
      console.info('hdrBrightness is: ' + obj.$attrs.hdrBrightness);
      expect(hdr.toFixed(1)).assertEqual('0.3');
      done();
    })
    it('ImageHDRBrightnessTest_003',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr08'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('hdrImageKey');
      let obj: ESObject = JSON.parse(strJson);
      let hdr: number = obj.$attrs.hdrBrightness
      console.info('hdrBrightness is: ' + obj.$attrs.hdrBrightness);
      expect(hdr.toFixed(1)).assertEqual('0.8');
      done()
    })
    it('ImageHDRBrightnessTest_004',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr10'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('hdrImageKey');
      let obj: ESObject = JSON.parse(strJson);
      let hdr: number = obj.$attrs.hdrBrightness
      console.info('hdrBrightness is: ' + obj.$attrs.hdrBrightness);
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })
    it('ImageHDRBrightnessTest_005',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr_1'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('hdrImageKey');
      let obj: ESObject = JSON.parse(strJson);
      let hdr: number = obj.$attrs.hdrBrightness
      console.info('hdrBrightness is: ' + obj.$attrs.hdrBrightness);
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })
    it('ImageHDRBrightnessTest_006',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr20'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('hdrImageKey');
      let obj: ESObject = JSON.parse(strJson);
      let hdr: number = obj.$attrs.hdrBrightness
      console.info('hdrBrightness is: ' + obj.$attrs.hdrBrightness);
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })
    it('ImageHDRBrightnessTest_007',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdr20'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('hdrImageKey');
      let obj: ESObject = JSON.parse(strJson);
      let hdr: number = obj.$attrs.hdrBrightness
      console.info('hdrBrightness is: ' + obj.$attrs.hdrBrightness);
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })
    it('ImageHDRBrightnessTest_008',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdrNull'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('hdrImageKey');
      let obj: ESObject = JSON.parse(strJson);
      let hdr: number = obj.$attrs.hdrBrightness
      console.info('hdrBrightness is: ' + obj.$attrs.hdrBrightness);
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })
    it('ImageHDRBrightnessTest_009',Level.LEVEL0, async (done: Function) => {
      const driver = Driver.create();
      const button = await driver.findComponent(ON.id('hdrUndefined'));
      await button.click();
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('hdrImageKey');
      let obj: ESObject = JSON.parse(strJson);
      let hdr: number = obj.$attrs.hdrBrightness
      console.info('hdrBrightness is: ' + obj.$attrs.hdrBrightness);
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done()
    })

    it('ImageHDRBrightnessTest_010',Level.LEVEL0, async (done: Function) => {
      let strJson = getInspectorByKey('noHdrBrightnessImageKey');
      let obj: ESObject = JSON.parse(strJson);
      let hdr: number = obj.$attrs.hdrBrightness
      console.info('hdrBrightness is: ' + obj.$attrs.hdrBrightness);
      expect(hdr.toFixed(1)).assertEqual('1.0');
      done();
    })

  })
}
