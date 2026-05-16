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

export default function TextTimerTextShadowTest() {
  describe('TextTimerTextShadowTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TextTimerTextShadowTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextTimer/TextTimerTextShadow',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextTimerTextShadowTest state pages:' + JSON.stringify(pages));
        if (!('TextTimerTextShadow' == pages.name)) {
          console.info('get TextTimerTextShadowTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TextTimerTextShadowTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextTimerTextShadowTest page error:' + err);
      }
      console.info('TextTimerTextShadowTest beforeEach end');
      done();
    });
    /**
     * @tc.name   TextTimerTextShadowTest_001
     * @tc.number TextTimerTextShadowTest_001
     * @tc.desc   To test the TextShadow { radius: 10, color: Color.Red, offsetX: 10, offsetY: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextTimerTextShadowTest_001', Level.LEVEL0, async (done: Function) => {
      console.info('TextTimerTextShadowTest_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textTimer1ShadowTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextTimerTextShadowTest_001 component obj is: ' + obj.$attrs.textShadow);
      expect(obj.$attrs.textShadow.radius).assertEqual('10.000000');
      expect(obj.$attrs.textShadow.color).assertEqual('#FFFF0000');
      expect(obj.$attrs.textShadow.offsetX).assertEqual('10.000000');
      expect(obj.$attrs.textShadow.offsetY).assertEqual('0.000000');
      console.info('[TextTimerTextShadowTest_001] END');
      done();
    });
    /**
     * @tc.name   TextTimerTextShadowTest_002
     * @tc.number TextTimerTextShadowTest_002
     * @tc.desc   To test the TextShadow { radius: -10, color: '#ff00ff00', offsetX: -10, offsetY: 0 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextTimerTextShadowTest_002', Level.LEVEL0, async (done: Function) => {
      console.info('TextTimerTextShadowTest_002 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textTimer2ShadowTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextTimerTextShadowTest_002 component obj is: ' + obj.$attrs.textShadow);
      expect(obj.$attrs.textShadow.radius).assertEqual('0.000000');
      expect(obj.$attrs.textShadow.color).assertEqual('#FF000000');
      expect(obj.$attrs.textShadow.offsetX).assertEqual('-10.000000');
      expect(obj.$attrs.textShadow.offsetY).assertEqual('0.000000');
      console.info('[TextTimerTextShadowTest_002] END');
      done();
    });
    /**
     * @tc.name   TextTimerTextShadowTest_003
     * @tc.number TextTimerTextShadowTest_003
     * @tc.desc   To test the TextShadow { radius: 50, color: $r('app.color.pink'), offsetX: 0, offsetY: 10 }
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TextTimerTextShadowTest_003', Level.LEVEL0, async (done: Function) => {
      console.info('TextTimerTextShadowTest_003 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('textTimer3ShadowTest');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextTimerTextShadowTest_003 component obj is: ' + obj.$attrs.textShadow);
      expect(obj.$attrs.textShadow.radius).assertEqual('50.000000');
      expect(obj.$attrs.textShadow.color).assertEqual('#FFFF00FF');
      expect(obj.$attrs.textShadow.offsetX).assertEqual('0.000000');
      expect(obj.$attrs.textShadow.offsetY).assertEqual('10.000000');
      console.info('[TextTimerTextShadowTest_003] END');
      done();
    });
  })
}
