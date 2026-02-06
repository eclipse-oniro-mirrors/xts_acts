'use static';
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import Utils from '../../../ets/MainAbility/common/Utils';


export default function ImageOnErrorTest() {
  describe('ImageOnErrorTest', () => {
    beforeAll(() => {
      console.info("ImageOnErrorTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.api20.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('ImageOnErrorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageError/ImageOnError',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ImageOnErrorTest state pages:' + JSON.stringify(pages));
        if (!('ImageOnError' === pages.name)) {
          console.info('get ImageOnErrorTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2500);
        }
      } catch (err) {
        console.error('push ImageOnErrorTest page error:' + err);
      }
      console.info('ImageOnErrorTest beforeEach end');
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_001
     * @tc.name     ImageOnErrorTest_static_001
     * @tc.desc     ImageOnErrorTest_static_001
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_001] START');
      await Utils.sleep(1500);
      let strJson = inspector.getInspectorByKey('101000msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_001] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('unknown source type.');

      let strJson1 = inspector.getInspectorByKey('101000');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_001] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('101000');
      console.info('[ImageOnErrorTest_static_001] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_002
     * @tc.name     ImageOnErrorTest_static_002
     * @tc.desc     ImageOnErrorTest_static_002
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_002] START');
      await Utils.sleep(1500);
      let strJson = inspector.getInspectorByKey('102030msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_002] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('wrong code format.');

      let strJson1 = inspector.getInspectorByKey('102030');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_002] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('102030');
      console.info('[ImageOnErrorTest_static_002] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_003
     * @tc.name     ImageOnErrorTest_static_003
     * @tc.desc     ImageOnErrorTest_static_003
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_003] START');
      await Utils.sleep(1500);
      let strJson = inspector.getInspectorByKey('102031msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_003] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('decode base64 image failed.');

      let strJson1 = inspector.getInspectorByKey('102031');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_003] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('102031');
      console.info('[ImageOnErrorTest_static_003] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_004
     * @tc.name     ImageOnErrorTest_static_004
     * @tc.desc     ImageOnErrorTest_static_004
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_004] START');
      await Utils.sleep(1500);
      let strJson = inspector.getInspectorByKey('102050msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_004] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('path is too long.');

      let strJson1 = inspector.getInspectorByKey('102050');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_004] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('102050');
      console.info('[ImageOnErrorTest_static_004] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_005
     * @tc.name     ImageOnErrorTest_static_005
     * @tc.desc     ImageOnErrorTest_static_005
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_005] START');
      await Utils.sleep(1500);
      let strJson = inspector.getInspectorByKey('102051msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_005] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('read data failed.');

      let strJson1 = inspector.getInspectorByKey('102051');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_005] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('102051');
      console.info('[ImageOnErrorTest_static_005] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_006
     * @tc.name     ImageOnErrorTest_static_006
     * @tc.desc     ImageOnErrorTest_static_006
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_006] START');
      await Utils.sleep(1500);
      let strJson = inspector.getInspectorByKey('102070msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_006] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('get image data by name failed.');

      let strJson1 = inspector.getInspectorByKey('102070');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_006] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('102070');
      console.info('[ImageOnErrorTest_static_006] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_007
     * @tc.name     ImageOnErrorTest_static_007
     * @tc.desc     ImageOnErrorTest_static_007
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_007] START');
      await Utils.sleep(1500);
      let strJson = inspector.getInspectorByKey('102072msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_007] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('uri is invalid.');

      let strJson1 = inspector.getInspectorByKey('102072');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_007] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('102072');
      console.info('[ImageOnErrorTest_static_007] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_008
     * @tc.name     ImageOnErrorTest_static_008
     * @tc.desc     ImageOnErrorTest_static_008
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_008] START');
      await Utils.sleep(1500);
      let strJson = inspector.getInspectorByKey('102091msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_008] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('get asset failed.');

      let strJson1 = inspector.getInspectorByKey('102091');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_008] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('102091');
      console.info('[ImageOnErrorTest_static_008] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_009
     * @tc.name     ImageOnErrorTest_static_009
     * @tc.desc     ImageOnErrorTest_static_009
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_009] START');
      await Utils.sleep(1500);
      let strJson = inspector.getInspectorByKey('102110msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_009] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('open file failed.');

      let strJson1 = inspector.getInspectorByKey('102110');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_009] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('102110');
      console.info('[ImageOnErrorTest_static_009] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_010
     * @tc.name     ImageOnErrorTest_static_010
     * @tc.desc     ImageOnErrorTest_static_010
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_010] START');
      await Utils.sleep(1500);
      let strJson = inspector.getInspectorByKey('102130msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_010] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('decoded data is empty.');

      let strJson1 = inspector.getInspectorByKey('102130');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_010] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('102130');
      console.info('[ImageOnErrorTest_static_010] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_011
     * @tc.name     ImageOnErrorTest_static_011
     * @tc.desc     ImageOnErrorTest_static_011
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_011] START');
      await Utils.sleep(13000);
      let strJson = inspector.getInspectorByKey('102131msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_011] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('load shared memory image data timeout.');

      let strJson1 = inspector.getInspectorByKey('102131');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_011] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('102131');
      console.info('[ImageOnErrorTest_static_011] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_012
     * @tc.name     ImageOnErrorTest_static_012
     * @tc.desc     ImageOnErrorTest_static_012
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_012] START');
      await Utils.sleep(13000);
      let strJson = inspector.getInspectorByKey('103100msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_012] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('make svg dom failed.');

      let strJson1 = inspector.getInspectorByKey('103100');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_012] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('103100');
      console.info('[ImageOnErrorTest_static_012] END');
      done();
    });

    
    /**
     * @tc.number   ImageOnErrorTest_static_013
     * @tc.name     ImageOnErrorTest_static_013
     * @tc.desc     ImageOnErrorTest_static_013
     * @tc.level   TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
    it('ImageOnErrorTest_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ImageOnErrorTest_static_013] START');
      await Utils.sleep(13000);
      let strJson = inspector.getInspectorByKey('103200msg');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ImageOnErrorTest_static_013] obj.$attrs.content is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('image data size is invalid.');

      let strJson1 = inspector.getInspectorByKey('103200');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[ImageOnErrorTest_static_013] obj1.$attrs.content is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('103200');
      console.info('[ImageOnErrorTest_static_013] END');
      done();
    });
  })
}