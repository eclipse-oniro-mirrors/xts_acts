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

    /**
     * @tc.name   ImageHDRBrightnessTest_001
     * @tc.number ImageHDRBrightnessTest_001
     * @tc.desc   ImageHDRBrightnessTest_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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

    /**
     * @tc.name   ImageHDRBrightnessTest_002
     * @tc.number ImageHDRBrightnessTest_002
     * @tc.desc   ImageHDRBrightnessTest_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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
    /**
     * @tc.name   ImageHDRBrightnessTest_003
     * @tc.number ImageHDRBrightnessTest_003
     * @tc.desc   ImageHDRBrightnessTest_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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
    /**
     * @tc.name   ImageHDRBrightnessTest_004
     * @tc.number ImageHDRBrightnessTest_004
     * @tc.desc   ImageHDRBrightnessTest_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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
    /**
     * @tc.name   ImageHDRBrightnessTest_005
     * @tc.number ImageHDRBrightnessTest_005
     * @tc.desc   ImageHDRBrightnessTest_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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
    /**
     * @tc.name   ImageHDRBrightnessTest_006
     * @tc.number ImageHDRBrightnessTest_006
     * @tc.desc   ImageHDRBrightnessTest_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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
    /**
     * @tc.name   ImageHDRBrightnessTest_007
     * @tc.number ImageHDRBrightnessTest_007
     * @tc.desc   ImageHDRBrightnessTest_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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
    /**
     * @tc.name   ImageHDRBrightnessTest_008
     * @tc.number ImageHDRBrightnessTest_008
     * @tc.desc   ImageHDRBrightnessTest_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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
    /**
     * @tc.name   ImageHDRBrightnessTest_009
     * @tc.number ImageHDRBrightnessTest_009
     * @tc.desc   ImageHDRBrightnessTest_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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

    /**
     * @tc.name   ImageHDRBrightnessTest_010
     * @tc.number ImageHDRBrightnessTest_010
     * @tc.desc   ImageHDRBrightnessTest_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
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
