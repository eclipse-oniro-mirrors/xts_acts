/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';
import { router } from '@kit.ArkUI';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON, } from '@ohos.UiTest';

export default function ColorMetricsNullUndefinedTest() {
  describe('ColorMetricsNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ColorMetricsNullUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/ColorMetricsNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ColorMetricsNullUndefinedTest state pages:' + JSON.stringify(pages));
        if (!('ColorMetricsNullUndefined' == pages.name)) {
          console.info('get ColorMetricsNullUndefinedTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push ColorMetricsNullUndefinedTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ColorMetricsNullUndefinedTest page error:' + err);
      }
      console.info('ColorMetricsNullUndefinedTest beforeEach end');
      done();
    });
    afterAll(async (done:Function)=>{
      AppStorage.delete('ColorMetricsResourceBlendColorNull')
      AppStorage.delete('ColorMetricsResourceBlendColorUndefined')
      done();
    })
    /**
     * @tc.name   ColorMetricsNullUndefinedTest_001
     * @tc.number ColorMetricsNullUndefinedTest_001
     * @tc.desc   To test ColorMetrics.rgba  null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ColorMetricsNullUndefinedTest_001', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('ColorMetricsNullUndefinedTest_001 START')
      let strJson = getInspectorByKey('ColorMetricsRgbaNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("ColorMetricsNullUndefinedTest_001 obj is: " + JSON.stringify(obj));
      console.info("[ColorMetricsNullUndefinedTest_001] backgroundColor: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.backgroundColor).assertEqual('#00000000')
      console.log('ColorMetricsNullUndefinedTest_001 END')
      done();
    });

    /**
     * @tc.name   ColorMetricsNullUndefinedTest_002
     * @tc.number ColorMetricsNullUndefinedTest_002
     * @tc.desc   To test ColorMetrics.rgba  undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ColorMetricsNullUndefinedTest_002', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('ColorMetricsNullUndefinedTest_002 START')
      let strJson = getInspectorByKey('ColorMetricsRgbaUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("ColorMetricsNullUndefinedTest_002 obj is: " + JSON.stringify(obj));
      console.info("[ColorMetricsNullUndefinedTest_002] backgroundColor: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.backgroundColor).assertEqual('#00000000')
      console.log('ColorMetricsNullUndefinedTest_002 END')
      done();
    });

    /**
     * @tc.name   ColorMetricsNullUndefinedTest_003
     * @tc.number ColorMetricsNullUndefinedTest_003
     * @tc.desc   To test ColorMetrics.colorWithSpace  null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ColorMetricsNullUndefinedTest_003', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('ColorMetricsNullUndefinedTest_003 START')
      let strJson = getInspectorByKey('ColorMetricsColorWithSpaceNull');
      let obj: ESObject = JSON.parse(strJson);
      console.info("ColorMetricsNullUndefinedTest_003 obj is: " + JSON.stringify(obj));
      console.info("[ColorMetricsNullUndefinedTest_003] backgroundColor: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.backgroundColor).assertEqual('#00000000')
      console.log('ColorMetricsNullUndefinedTest_003 END')
      done();
    });

    /**
     * @tc.name   ColorMetricsNullUndefinedTest_004
     * @tc.number ColorMetricsNullUndefinedTest_004
     * @tc.desc   To test ColorMetrics.colorWithSpace  undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ColorMetricsNullUndefinedTest_004', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('ColorMetricsNullUndefinedTest_004 START')
      let strJson = getInspectorByKey('ColorMetricsColorWithSpaceUndefined');
      let obj: ESObject = JSON.parse(strJson);
      console.info("ColorMetricsNullUndefinedTest_004 obj is: " + JSON.stringify(obj));
      console.info("[ColorMetricsNullUndefinedTest_004] backgroundColor: " + obj.$attrs.backgroundColor);
      expect(obj.$attrs.backgroundColor).assertEqual('#00000000')
      console.log('ColorMetricsNullUndefinedTest_004 END')
      done();
    });

    /**
     * @tc.name   ColorMetricsNullUndefinedTest_005
     * @tc.number ColorMetricsNullUndefinedTest_005
     * @tc.desc   To test ColorMetrics.resourceColor.blendColor  null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ColorMetricsNullUndefinedTest_005', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('ColorMetricsNullUndefinedTest_005 START')
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ColorMetricsResourceBlendColorNull'));
      await Utils.sleep(200);
      await btn.click()
      await Utils.sleep(200);
      expect(AppStorage.get('ColorMetricsResourceBlendColorNull')).assertEqual(true)
      console.log('ColorMetricsNullUndefinedTest_005 END')
      done();
    });


    /**
     * @tc.name   ColorMetricsNullUndefinedTest_006
     * @tc.number ColorMetricsNullUndefinedTest_006
     * @tc.desc   To test ColorMetrics.resourceColor.blendColor  undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ColorMetricsNullUndefinedTest_006', Level.LEVEL2, async (done: Function) => {
      await Utils.sleep(1000);
      console.log('ColorMetricsNullUndefinedTest_006 START')
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ColorMetricsResourceBlendColorUndefined'));
      await Utils.sleep(200);
      await btn.click()
      await Utils.sleep(200);
      expect(AppStorage.get('ColorMetricsResourceBlendColorUndefined')).assertEqual(true)
      console.log('ColorMetricsNullUndefinedTest_006 END')
      done();
    });

  })
}