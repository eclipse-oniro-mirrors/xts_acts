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

export default function QRCodeResourceStrTest() {
  describe('QRCodeResourceStrTest', () => {
    beforeEach(async (done: Function) => {
      console.info('QRCodeResourceStrTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/QRCode/QRCodeResourceStrTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get QRCodeResourceStrTest state pages:' + JSON.stringify(pages));
        if (!('QRCodeResourceStrTest' === pages.name)) {
          console.info('get QRCodeResourceStrTest pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2500);
          console.info('push QRCodeResourceStrTest page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push QRCodeResourceStrTest page error:' + err);
      }
      console.info('QRCodeResourceStrTest beforeEach end');
      done();
    });

    /**
     * @tc.name   QRCodeResourceStrTest_001
     * @tc.number QRCodeResourceStrTest_001
     * @tc.desc   To test the value: $r('app.string.module_desc')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('QRCodeResourceStrTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('QRCodeResourceStrTest_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('QRCodeResource');
      let obj: ESObject = JSON.parse(strJson);
      console.info('QRCodeResourceStrTest_001 component obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('module description');
      console.info('[QRCodeResourceStrTest_001] END');
      done();
    });
  
    /**
     * @tc.name   QRCodeResourceStrTest_002
     * @tc.number QRCodeResourceStrTest_002
     * @tc.desc   To test the value: undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('QRCodeResourceStrTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('QRCodeResourceStrTest_002 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('QRCode1Resource');
      let obj: ESObject = JSON.parse(strJson);
      console.info('QRCodeResourceStrTest_002 component obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('undefined');
      console.info('[QRCodeResourceStrTest_002] END');
      done();
    });
    
    /**
     * @tc.name   QRCodeResourceStrTest_003
     * @tc.number QRCodeResourceStrTest_003
     * @tc.desc   To test the value: null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('QRCodeResourceStrTest_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('QRCodeResourceStrTest_003 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('QRCode2Resource');
      let obj: ESObject = JSON.parse(strJson);
      console.info('QRCodeResourceStrTest_003 component obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('null');
      console.info('[QRCodeResourceStrTest_003] END');
      done();
    });

    
    /**
     * @tc.name   QRCodeResourceStrTest_004
     * @tc.number QRCodeResourceStrTest_004
     * @tc.desc   To test the value: null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('QRCodeResourceStrTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('QRCodeResourceStrTest_004 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('QRCode3Resource');
      let obj: ESObject = JSON.parse(strJson);
      console.info('QRCodeResourceStrTest_004 component obj is: ' + obj.$attrs.value);
      expect(obj.$attrs.value).assertEqual('resourceStr');
      console.info('[QRCodeResourceStrTest_004] END');
      done();
    });
  })
}
