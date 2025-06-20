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

export default function ProgressContentTest() {
  describe('ProgressContentTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ProgressContentTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/progress/ProgressContent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get ProgressContentTest state pages:' + JSON.stringify(pages));
        if (!('ProgressContent' === pages.name)) {
          console.info('get ProgressContentTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push ProgressContentTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push ProgressContentTest page error:' + err);
      }
      console.info('ProgressContentTest beforeEach end');
      done();
    });

    /**
    * @tc.number: ProgressContentTest_001
    * @tc.name  : ProgressContentTest_001
    * @tc.desc  : To test the content: $r('app.string.module_desc')
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('ProgressContentTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('ProgressContentTest_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('ProgressStyleContent');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[ProgressContentTest_001] obj is: ' + obj.$attrs.capsuleStyle.content);
      expect(obj.$attrs.capsuleStyle.content).assertEqual('module description');
      console.info('[ProgressContentTest_001] END');
      done();
    });

    /**
    * @tc.number: ProgressContentTest_002
    * @tc.name  : ProgressContentTest_002
    * @tc.desc  : To test the content: undefined
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('ProgressContentTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('ProgressContentTest_002 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('ProgressStyleContent1');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[ProgressContentTest_002] obj is: ' + obj.$attrs.capsuleStyle.content);
      expect(obj.$attrs.capsuleStyle.content).assertEqual('');
      console.info('[ProgressContentTest_002] END');
      done();
    });

    /**
    * @tc.number: ProgressContentTest_003
    * @tc.name  : ProgressContentTest_003
    * @tc.desc  : To test the content: null
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('ProgressContentTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('ProgressContentTest_003 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('ProgressStyleContent2');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[ProgressContentTest_003] obj is: ' + obj.$attrs.capsuleStyle.content);
      expect(obj.$attrs.capsuleStyle.content).assertEqual('');
      console.info('[ProgressContentTest_003] END');
      done();
    });
    
    /**
    * @tc.number: ProgressContentTest_004
    * @tc.name  : ProgressContentTest_004
    * @tc.desc  : To test the content: Progress
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('ProgressContentTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('ProgressContentTest_004 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('ProgressStyleContent3');
      let obj: ESObject = JSON.parse(strJson);
      await Utils.sleep(1000);
      console.info('[ProgressContentTest_004] obj is: ' + obj.$attrs.capsuleStyle.content);
      expect(obj.$attrs.capsuleStyle.content).assertEqual('Progress');
      console.info('[ProgressContentTest_004] END');
      done();
    });
  })
}
