/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
let emitKey = "emitUserAgent";
export default function clickeffectTest() {
  describe('ActsClickEffectTest',   ()=> {
    beforeEach(async   (done:Function)=> {
      console.info("ActsClickEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/clickeffect/Index',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ActsClickEffectTest state pages: " + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get ActsClickEffectTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ActsClickEffectTest page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ActsClickEffectTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_0100
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_0100
     * @tc.desc   Set the parameter to Light level with default scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_0100', Level.LEVEL2, async   (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0100 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_1');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_0100]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('0');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.900000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_0200
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_0200
     * @tc.desc   Set the parameter to Middle level with default scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_0200', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0200 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_2');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_0200]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('1');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.950000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_0300
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_0300
     * @tc.desc   Set the parameter to Heavy level with default scale
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_0300', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0300 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_3');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_0300]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('2');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.950000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_0400
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_0400
     * @tc.desc   Set the level to Light and set scale to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_0400', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0400 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_4');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_0400]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('0');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.000000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_0500
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_0500
     * @tc.desc   Set the level to Light and set scale to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_0500', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0500 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_5');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_0500]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('0');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('1.000000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_0600
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_0600
     * @tc.desc   Set the level to Light and set scale to 0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_0600', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Options_0600 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_6');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_0600]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('0');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.500000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_0700
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_0700
     * @tc.desc   Set the level to Light and set scale to 0.8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_0700', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0700 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_7');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_0700]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('0');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.800000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0700 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_0800
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_0800
     * @tc.desc   Set the level to Light and set scale to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_0800', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0800 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_8');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_0800]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('0');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.900000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0800 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_0900
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_0900
     * @tc.desc   Set the level to null and set scale to 0.1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_0900', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_0900 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_9');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_0900]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('0');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.100000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_0900 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_1000
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_1000
     * @tc.desc   Set the level to undefine and set scale to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_1000', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1000 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_10');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_1000]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('0');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.000000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1000 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_1100
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_1100
     * @tc.desc   First Set the level to Middle, set the scale to 0.2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_1100', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Options_01000 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_11');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_1100]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('2');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.100000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1100 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_1200
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_1200
     * @tc.desc   First Set the level to Middle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_1200', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1200 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_12');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_1200]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('0');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.900000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1200 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_1300
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_1300
     * @tc.desc   First Set the level to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_1300', Level.LEVEL2, async   (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1300 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_13');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_1300]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('1');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.950000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1300 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_1400
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_1400
     * @tc.desc   First Set the level to Heavy and set the scale to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_1400', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1400 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_14');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_1400]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('2');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.950000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1400 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_1500
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_1500
     * @tc.desc   First Set the level to Middle and set the scale to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_1500', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1500 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_15');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_1500]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('1');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.950000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1500 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });

    /**
     * @tc.name   ArkUXII_Stage_ClickEffect_Toggle_1600
     * @tc.number ArkUXII_Stage_ClickEffect_Toggle_1600
     * @tc.desc   First Set the level to undefined and set the scale to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArkUXII_Stage_ClickEffect_Toggle_1600', Level.LEVEL0, async (done:Function)=> {
      console.info("ArkUXII_Stage_ClickEffect_Toggle_1600 start");
      setTimeout(() => {
        try {
          let strJson = getInspectorByKey('clickEffect_16');
           console.info("[ArkUXII_Stage_ClickEffect_Toggle_1600]:" + JSON.stringify(JSON.parse(strJson).$attrs.clickEffect));
          expect(JSON.parse(strJson).$attrs.clickEffect.level).assertEqual('0');
          expect(JSON.parse(strJson).$attrs.clickEffect.scale).assertEqual('0.900000');
          done();
        } catch (err) {
          expect().assertFail();
          console.info('ArkUXII_Stage_ClickEffect_Toggle_1600 ERR ' + JSON.stringify(err));
          done();
        }
      }, 500)
    });
  })
}
