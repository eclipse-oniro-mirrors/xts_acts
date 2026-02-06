/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { ON, BY, Driver, UiDriver } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';

export default function TextTimerFontWeightTest() {
  describe('TextTimerFontWeightTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TextTimerFontWeightTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextTimer/TextTimerFontWeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextTimerFontWeightTest state pages:' + JSON.stringify(pages));
        if (!('TextTimerFontWeight' === pages.name)) {
          console.info('get TextTimerFontWeightTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TextTimerFontWeightTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextTimerFontWeightTest page error:' + err);
      }
      console.info('TextTimerFontWeightTest beforeEach end');
      done();
    });

    /**
     * @tc.name   TextTimerFontWeightTest_001
     * @tc.number TextTimerFontWeightTest_001
     * @tc.desc   To test the fontWeight： $r('app.string.lighter')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextTimerFontWeightTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextTimerFontWeightTest_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextTimerFontWeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextTimerFontWeightTest_001 component obj is: ' + obj.$attrs.fontWeight);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
    
      console.info('[TextTimerFontWeightTest_001] END');
      done();
    });
   
    /**
     * @tc.name   TextTimerFontWeightTest_002
     * @tc.number TextTimerFontWeightTest_002
     * @tc.desc   To test the fontWeight： undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextTimerFontWeightTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextTimerFontWeightTest_002 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextTimer1FontWeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextTimerFontWeightTest_002 component obj is: ' + obj.$attrs.fontWeight);
      let strJson_base = getInspectorByKey('TextTimer_base');
      let obj_base: ESObject = JSON.parse(strJson_base);
      console.info('TextTimerFontWeightTest_003 component obj_base is: ' + obj_base.$attrs.fontWeight);
      expect(obj.$attrs.fontWeight).assertEqual(obj_base.$attrs.fontWeight);
    
      console.info('[TextTimerFontWeightTest_002] END');
      done();
    });

    
    /**
     * @tc.name   TextTimerFontWeightTest_003
     * @tc.number TextTimerFontWeightTest_003
     * @tc.desc   To test the fontWeight： null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextTimerFontWeightTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextTimerFontWeightTest_003 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextTimer2FontWeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextTimerFontWeightTest_003 component obj is: ' + obj.$attrs.fontWeight);
      let strJson_base = getInspectorByKey('TextTimer_base');
      let obj_base: ESObject = JSON.parse(strJson_base);
      console.info('TextTimerFontWeightTest_003 component obj_base is: ' + obj_base.$attrs.fontWeight);
      expect(obj.$attrs.fontWeight).assertEqual(obj_base.$attrs.fontWeight);
    
      console.info('[TextTimerFontWeightTest_003] END');
      done();
    });

    
    /**
     * @tc.name   TextTimerFontWeightTest_004
     * @tc.number TextTimerFontWeightTest_004
     * @tc.desc   To test the fontWeight： FontWeight.Lighter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextTimerFontWeightTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextTimerFontWeightTest_004 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextTimer3FontWeight');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextTimerFontWeightTest_004 component obj is: ' + obj.$attrs.fontWeight);
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
    
      console.info('[TextTimerFontWeightTest_004] END');
      done();
    });
  })
}
