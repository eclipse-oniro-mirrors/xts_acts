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

export default function TextClockFormatTest() {
  describe('TextClockFormatTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TextClockFormatTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextClock/TextClockFormat',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextClockFormatTest state pages:' + JSON.stringify(pages));
        if (!('TextClockFormat' === pages.name)) {
          console.info('get TextClockFormatTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push TextClockFormatTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TextClockFormatTest page error:' + err);
      }
      console.info('TextClockFormatTest beforeEach end');
      done();
    });

    /**
     * @tc.name   TextClockFormatTest_001
     * @tc.number TextClockFormatTest_001
     * @tc.desc   To test the format：$r('app.string.textClock1')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextClockFormatTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextClockFormatTest_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextClockFormat');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextClockFormatTest_001 component obj is: ' + obj.$attrs.format);
      expect(obj.$attrs.format).assertEqual('yyyy年M月d日 EEEE');
      console.info('[TextClockFormatTest_001] END');
      done();
    });
  
    /**
     * @tc.name   TextClockFormatTest_002
     * @tc.number TextClockFormatTest_002
     * @tc.desc   To test the format：undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextClockFormatTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextClockFormatTest_002 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextClockFormat1');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextClockFormatTest_002 component obj is: ' + obj.$attrs.format);
      expect(obj.$attrs.format).assertEqual('aa hh:mm:ss');
      console.info('[TextClockFormatTest_002] END');
      done();
    });
    
    /**
     * @tc.name   TextClockFormatTest_003
     * @tc.number TextClockFormatTest_003
     * @tc.desc   To test the format：null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextClockFormatTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextClockFormatTest_003 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextClockFormat2');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextClockFormatTest_003 component obj is: ' + obj.$attrs.format);
      expect(obj.$attrs.format).assertEqual('aa hh:mm:ss');
      console.info('[TextClockFormatTest_003] END');
      done();
    });
    
    /**
     * @tc.name   TextClockFormatTest_004
     * @tc.number TextClockFormatTest_004
     * @tc.desc   To test the format：yyyy年M月d日
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TextClockFormatTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('TextClockFormatTest_004 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('TextClockFormat3');
      let obj: ESObject = JSON.parse(strJson);
      console.info('TextClockFormatTest_004 component obj is: ' + obj.$attrs.format);
      expect(obj.$attrs.format).assertEqual('yyyy年M月d日');
      console.info('[TextClockFormatTest_004] END');
      done();
    });
  })
}
