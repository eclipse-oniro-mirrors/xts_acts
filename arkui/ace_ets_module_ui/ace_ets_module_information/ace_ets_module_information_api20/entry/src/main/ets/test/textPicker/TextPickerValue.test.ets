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

export default function TextPickerValue() {
  describe('TextPickerValue', () => {
    beforeEach(async (done: Function) => {
      console.info('TextPickerValue beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textPicker/TextPickerValue',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextPickerValue state pages:' + JSON.stringify(pages));
        if (!('TextPickerValue' === pages.name)) {
          console.info('get TextPickerValue pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TextPickerValue page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextPickerValue page error:' + err);
      }
      console.info('TextPickerValue beforeEach end');
      done();
    });

    /**
     * @tc.name   TextPickerValue_001
     * @tc.number TextPickerValue_001
     * @tc.desc   To test the value: $r('app.string.apple')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerValue_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextPickerValue_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextPicker');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextPickerValue_001 component obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('apple');
      console.info('[TextPickerValue_001] END');
      done();
    });
  
    /**
     * @tc.name   TextPickerValue_002
     * @tc.number TextPickerValue_002
     * @tc.desc   To test the value: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerValue_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextPickerValue_002 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextPicker1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextPickerValue_002 component obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('apple');
      console.info('[TextPickerValue_002] END');
      done();
    });

    /**
     * @tc.name   TextPickerValue_003
     * @tc.number TextPickerValue_003
     * @tc.desc   To test the value: null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerValue_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextPickerValue_003 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextPicker2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextPickerValue_003 component obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('apple');
      console.info('[TextPickerValue_003] END');
      done();
    });
    
    /**
     * @tc.name   TextPickerValue_004
     * @tc.number TextPickerValue_004
     * @tc.desc   To test the value: apple
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextPickerValue_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextPickerValue_004 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextPicker3');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextPickerValue_004 component obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('apple');
      console.info('[TextPickerValue_004] END');
      done();
    });
  })
}
