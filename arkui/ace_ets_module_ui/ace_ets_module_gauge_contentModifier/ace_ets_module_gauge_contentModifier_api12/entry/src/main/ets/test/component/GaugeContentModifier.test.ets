/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium';
import Utils from './Utils';


export default function GaugeContentModifier() {
  describe('GaugeContentModifier', () => {
    beforeEach(async (done: Function) => {
      console.info('GaugeContentModifier beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/GaugeContentModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get GaugeContentModifier state success ' + JSON.stringify(pages));
        if (!('GaugeContentModifier' == pages.name)) {
          console.info('get GaugeContentModifier state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info('push GaugeContentModifier page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push GaugeContentModifier page error: ' + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('GaugeContentModifier after each called');
    });
    /**
     * @tc.name   GaugeContentModifier_001
     * @tc.number GaugeContentModifier_001
     * @tc.desc   test GaugeContentModifier_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_001', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_001] START');
      let strJson = getInspectorByKey('GaugeContentModifier01');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_001] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('value:60');
      console.info('[GaugeContentModifier_001] END');
      done();
    });
    /**
     * @tc.name   GaugeContentModifier_002
     * @tc.number GaugeContentModifier_002
     * @tc.desc   test GaugeContentModifier_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_002', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_001] START');
      let strJson = getInspectorByKey('GaugeContentModifier02');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_002] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('min:0');
      console.info('[GaugeContentModifier_002] END');
      done();
    });
    /**
     * @tc.name   GaugeContentModifier_003
     * @tc.number GaugeContentModifier_003
     * @tc.desc   test GaugeContentModifier_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_003', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_003] START');
      let strJson = getInspectorByKey('GaugeContentModifier03');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_003] obj3 is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('max:100');
      console.info('[GaugeContentModifier_003] END');
      done();
    });
    /**
     * @tc.name   GaugeContentModifier_004
     * @tc.number GaugeContentModifier_004
     * @tc.desc   test GaugeContentModifier_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_004', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_004] START');
      let strJson = getInspectorByKey('GaugeContentModifier04');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_004] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('startAngle:20');
      console.info('[GaugeContentModifier_004] END');
      done();
    });
    /**
     * @tc.name   GaugeContentModifier_005
     * @tc.number GaugeContentModifier_005
     * @tc.desc   test GaugeContentModifier_005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_005', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_005] START');
      let strJson = getInspectorByKey('GaugeContentModifier05');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_005] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('endAngle:180');
      console.info('[GaugeContentModifier_005] END');
      done();
    });
    /**
     * @tc.name   GaugeContentModifier_006
     * @tc.number GaugeContentModifier_006
     * @tc.desc   test GaugeContentModifier_006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_006', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_006] START');
      let strJson = getInspectorByKey('GaugeContentModifier06');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_006] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('colors:#ff000000');
      console.info('[GaugeContentModifier_006] END');
      done();
    });
    /**
     * @tc.name   GaugeContentModifier_007
     * @tc.number GaugeContentModifier_007
     * @tc.desc   test GaugeContentModifier_007
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_007', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_007] START');
      let strJson = getInspectorByKey('GaugeContentModifier07');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_007] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('strokeWidth:20');
      console.info('[GaugeContentModifier_007] END');
      done();
    });
    /**
     * @tc.name   GaugeContentModifier_008
     * @tc.number GaugeContentModifier_008
     * @tc.desc   test GaugeContentModifier_008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_008', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_008] START');
      let strJson = getInspectorByKey('GaugeContentModifier08');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_008] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('width:100');
      console.info('[GaugeContentModifier_008] END');
      done();
    });

    /**
     * @tc.name   GaugeContentModifier_009
     * @tc.number GaugeContentModifier_009
     * @tc.desc   test GaugeContentModifier_009
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_009', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_009] START');
      let strJson = getInspectorByKey('GaugeContentModifier09');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_009] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('height:100');
      console.info('[GaugeContentModifier_009] END');
      done();
    });
    /**
     * @tc.name   GaugeContentModifier_010
     * @tc.number GaugeContentModifier_010
     * @tc.desc   test GaugeContentModifier_010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_010', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_010] START');
      let strJson = getInspectorByKey('GaugeContentModifier10');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_010] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('sizeWidth:100');
      console.info('[GaugeContentModifier_010] END');
      done();
    });

    /**
     * @tc.name   GaugeContentModifier_011
     * @tc.number GaugeContentModifier_011
     * @tc.desc   test GaugeContentModifier_011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_011', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_011] START');
      let strJson = getInspectorByKey('GaugeContentModifier11');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_011] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('sizeHeight:100');
      console.info('[GaugeContentModifier_011] END');
      done();
    });

    /**
     * @tc.name   GaugeContentModifier_012
     * @tc.number GaugeContentModifier_012
     * @tc.desc   test GaugeContentModifier_012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_012', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_012] START');
      let strJson = getInspectorByKey('GaugeContentModifier12');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_012] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('padding:20');
      console.info('[GaugeContentModifier_012] END');
      done();
    });

    /**
     * @tc.name   GaugeContentModifier_013
     * @tc.number GaugeContentModifier_013
     * @tc.desc   test GaugeContentModifier_013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_013', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_013] START');
      let strJson = getInspectorByKey('GaugeContentModifier13');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_013] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('margin:10');
      console.info('[GaugeContentModifier_013] END');
      done();
    });

    /**
     * @tc.name   GaugeContentModifier_014
     * @tc.number GaugeContentModifier_014
     * @tc.desc   test GaugeContentModifier_014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_014', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_014] START');
      let strJson = getInspectorByKey('GaugeContentModifier14');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_014] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('layoutWeight:5');
      console.info('[GaugeContentModifier_014] END');
      done();
    });

    /**
     * @tc.name   GaugeContentModifier_015
     * @tc.number GaugeContentModifier_015
     * @tc.desc   test GaugeContentModifier_015
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_015', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_015] START');
      let strJson = getInspectorByKey('GaugeContentModifier15');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_015] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('constraintSizeMinWidth:1');
      console.info('[GaugeContentModifier_015] END');
      done();
    });
    /**
     * @tc.name   GaugeContentModifier_016
     * @tc.number GaugeContentModifier_016
     * @tc.desc   test GaugeContentModifier_016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_016', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_016] START');
      let strJson = getInspectorByKey('GaugeContentModifier16');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_016] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('constraintSizeMaxWidth:100');
      console.info('[GaugeContentModifier_016] END');
      done();
    });
    /**
     * @tc.name   GaugeContentModifier_017
     * @tc.number GaugeContentModifier_017
     * @tc.desc   test GaugeContentModifier_017
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_017', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_017] START');
      let strJson = getInspectorByKey('GaugeContentModifier17');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_017] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('constraintSizeMinHeight:1');
      console.info('[GaugeContentModifier_017] END');
      done();
    });
    /**
     * @tc.name   GaugeContentModifier_018
     * @tc.number GaugeContentModifier_018
     * @tc.desc   test GaugeContentModifier_018
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('GaugeContentModifier_018', Level.LEVEL0, async (done: Function) => {
      console.info('[GaugeContentModifier_018] START');
      let strJson = getInspectorByKey('GaugeContentModifier18');
      let obj: Record<string, ESObject>= JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_018] obj is: ' + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('constraintSizeMaxHeight:100');
      console.info('[GaugeContentModifier_018] END');
      done();
    });
  })
}