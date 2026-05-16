'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll,beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage, LocalStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

export default function GaugeContentModifier() {
  describe('GaugeContentModifier', () => {
    beforeAll(() => {
      console.info("GaugeContentModifier beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      console.info("GaugeContentModifier beforeAll startAbility");
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GaugeContentModifier beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/component/GaugeContentModifier',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get GaugeContentModifier state pages:" + JSON.stringify(pages));
        if (!("GaugeContentModifier" == pages.name)) {
          console.info("get GaugeContentModifier pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push GaugeContentModifier page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GaugeContentModifier page error:" + err);
      }
      console.info("GaugeContentModifier beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('GaugeContentModifier after each called');
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_001
     * @tc.name     GaugeContentModifier_static_001
     * @tc.desc     GaugeContentModifier_static_001
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_001] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier01');
      console.info('[wll]'+strJson)
      await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_001] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('value:60');
      console.info('[GaugeContentModifier_001] END');
      done();
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_002
     * @tc.name     GaugeContentModifier_static_002
     * @tc.desc     GaugeContentModifier_static_002
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_002] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier02');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_002] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('min:0');
      console.info('[GaugeContentModifier_002] END');
      done();
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_003
     * @tc.name     GaugeContentModifier_static_003
     * @tc.desc     GaugeContentModifier_static_003
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_003] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier03');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_003] obj3 is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('max:100');
      console.info('[GaugeContentModifier_003] END');
      done();
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_004
     * @tc.name     GaugeContentModifier_static_004
     * @tc.desc     GaugeContentModifier_static_004
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_004] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier04');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_004] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('startAngle:20');
      console.info('[GaugeContentModifier_004] END');
      done();
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_005
     * @tc.name     GaugeContentModifier_static_005
     * @tc.desc     GaugeContentModifier_static_005
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_005] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier05');
      await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_005] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('endAngle:180');
      console.info('[GaugeContentModifier_005] END');
      done();
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_006
     * @tc.name     GaugeContentModifier_static_006
     * @tc.desc     GaugeContentModifier_static_006
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_006] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier06');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_006] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('colors:#ff000000');
      console.info('[GaugeContentModifier_006] END');
      done();
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_007
     * @tc.name     GaugeContentModifier_static_007
     * @tc.desc     GaugeContentModifier_static_007
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_007] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier07');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_007] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('strokeWidth:20');
      console.info('[GaugeContentModifier_007] END');
      done();
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_008
     * @tc.name     GaugeContentModifier_static_008
     * @tc.desc     GaugeContentModifier_static_008
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_008] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier08');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_008] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('width:100');
      console.info('[GaugeContentModifier_008] END');
      done();
    });

    
    



    /**
     * @tc.number   GaugeContentModifier_static_009
     * @tc.name     GaugeContentModifier_static_009
     * @tc.desc     GaugeContentModifier_static_009
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_009] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier09');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_009] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('height:100');
      console.info('[GaugeContentModifier_009] END');
      done();
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_010
     * @tc.name     GaugeContentModifier_static_010
     * @tc.desc     GaugeContentModifier_static_010
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_010] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier10');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_010] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('sizeWidth:100');
      console.info('[GaugeContentModifier_010] END');
      done();
    });

    
    



    /**
     * @tc.number   GaugeContentModifier_static_011
     * @tc.name     GaugeContentModifier_static_011
     * @tc.desc     GaugeContentModifier_static_011
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_011', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_011] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier11');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_011] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('sizeHeight:100');
      console.info('[GaugeContentModifier_011] END');
      done();
    });

    
    



    /**
     * @tc.number   GaugeContentModifier_static_012
     * @tc.name     GaugeContentModifier_static_012
     * @tc.desc     GaugeContentModifier_static_012
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_012', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_012] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier12');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_012] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('padding:20');
      console.info('[GaugeContentModifier_012] END');
      done();
    });

    
    



    /**
     * @tc.number   GaugeContentModifier_static_013
     * @tc.name     GaugeContentModifier_static_013
     * @tc.desc     GaugeContentModifier_static_013
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_013', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_013] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier13');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_013] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('margin:10');
      console.info('[GaugeContentModifier_013] END');
      done();
    });

    
    



    /**
     * @tc.number   GaugeContentModifier_static_014
     * @tc.name     GaugeContentModifier_static_014
     * @tc.desc     GaugeContentModifier_static_014
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_014', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_014] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier14');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_014] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('layoutWeight:5');
      console.info('[GaugeContentModifier_014] END');
      done();
    });

    
    



    /**
     * @tc.number   GaugeContentModifier_static_015
     * @tc.name     GaugeContentModifier_static_015
     * @tc.desc     GaugeContentModifier_static_015
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_015', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_015] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier15');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_015] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('constraintSizeMinWidth:1');
      console.info('[GaugeContentModifier_015] END');
      done();
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_016
     * @tc.name     GaugeContentModifier_static_016
     * @tc.desc     GaugeContentModifier_static_016
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_016', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_016] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier16');
  await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_016] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('constraintSizeMaxWidth:100');
      console.info('[GaugeContentModifier_016] END');
      done();
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_017
     * @tc.name     GaugeContentModifier_static_017
     * @tc.desc     GaugeContentModifier_static_017
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_017', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_017] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier17');
      await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_017] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('constraintSizeMinHeight:1');
      console.info('[GaugeContentModifier_017] END');
      done();
    });
    
    



    /**
     * @tc.number   GaugeContentModifier_static_018
     * @tc.name     GaugeContentModifier_static_018
     * @tc.desc     GaugeContentModifier_static_018
     * @tc.level    Level.LEVEL0
     */
it('GaugeContentModifier_static_018', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[GaugeContentModifier_018] START');
      let strJson = inspector.getInspectorByKey('GaugeContentModifier18');
      await Utils.sleep(1000);
      let obj =  JSON.parseJsonElement(strJson);
      await Utils.sleep(1000);
      console.info('[GaugeContentModifier_018] obj is: ' + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('constraintSizeMaxHeight:100');
      console.info('[GaugeContentModifier_018] END');
      done();
    });
  })
}