'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import router from '@ohos.router';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium'
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../../test/Util.test'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function remoteWindowJsunit() {
  describe('remoteWindowTest', () => {

    beforeAll(() => {
      console.info("remoteWindowJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.animation.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("remoteWindowJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RemoteWindow/remoteWindow',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get remoteWindowJsunit state pages:" + JSON.stringify(pages));
        if (!("remoteWindow" == pages.name)) {
          console.info("get remoteWindowJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push playModeReverseTest page error:" + err);
      }
      console.info("playModeReverseTest beforeEach end");
    });

    afterEach(async () => {
      await UtilsTest.msSleep(1000);
      console.info("remoteWindow after each called");
    });

    
    /**
     * @tc.number   testRemoteWindow_static_0001
     * @tc.name     testRemoteWindow_static_0001
     * @tc.desc     testRemoteWindow_static_0001
     * @tc.level    Level.LEVEL0
     */
it('testRemoteWindow_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('remoteWindow testRemoteWindow_static_0001 START');
      await Utils.sleep(2000);
      console.log('test start 011')
      let strJson = inspector.getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      console.log('test after 011')
      await Utils.sleep(2000);
      // console.info("[testRemoteWindow_static_0001] component width strJson:" + JSON.stringify(strJson));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')).assertEqual('100.00vp');
      console.info("[testRemoteWindow_static_0001] width value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('width'));
      done();
    });

    
    /**
     * @tc.number   testRemoteWindow_static_0002
     * @tc.name     testRemoteWindow_static_0002
     * @tc.desc     testRemoteWindow_static_0002
     * @tc.level    Level.LEVEL0
     */
it('testRemoteWindow_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RemoteWindow testRemoteWindow_static_0002 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      await Utils.sleep(2000);
      console.info("[testRemoteWindow_static_0002] component height strJson:" + JSON.stringify(strJson));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')).assertEqual('70.00vp');
      console.info("[testRemoteWindow_static_0002] height value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('height'));
      done();
    });

    
    /**
     * @tc.number   testRemoteWindow_static_0003
     * @tc.name     testRemoteWindow_static_0003
     * @tc.desc     testRemoteWindow_static_0003
     * @tc.level    Level.LEVEL0
     */
it('testRemoteWindow_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RemoteWindow testRemoteWindow_static_0003 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      await Utils.sleep(2000);
      console.info("[testRemoteWindow_static_0003] component fontSize strJson:" + JSON.stringify(strJson));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
      console.info("[testRemoteWindow_static_0003] fontSize value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontSize'));
      done();
    });

    
    /**
     * @tc.number   testRemoteWindow_static_0004
     * @tc.name     testRemoteWindow_static_0004
     * @tc.desc     testRemoteWindow_static_0004
     * @tc.level    Level.LEVEL0
     */
it('testRemoteWindow_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RemoteWindow testRemoteWindow_static_0004 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      await Utils.sleep(2000);
      console.info("[testRemoteWindow_static_0004] component opacity strJson:" + JSON.stringify(strJson));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity')).assertEqual(1);
      console.info("[testRemoteWindow_static_0004] opacity value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getDouble('opacity'));
      done();
    });

    
    /**
     * @tc.number   testRemoteWindow_static_0005
     * @tc.name     testRemoteWindow_static_0005
     * @tc.desc     testRemoteWindow_static_0005
     * @tc.level    Level.LEVEL0
     */
it('testRemoteWindow_static_0005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RemoteWindow testRemoteWindow_static_0005 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      await Utils.sleep(2000);
      console.info("[testRemoteWindow_static_0005] component align strJson:" + JSON.stringify(strJson));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual('Alignment.TopStart');
      console.info("[testRemoteWindow_static_0005] align value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('align'));
      done();
    });

    
    /**
     * @tc.number   testRemoteWindow_static_0006
     * @tc.name     testRemoteWindow_static_0006
     * @tc.desc     testRemoteWindow_static_0006
     * @tc.level    Level.LEVEL0
     */
it('testRemoteWindow_static_0006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RemoteWindow testRemoteWindow_static_0006 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      await Utils.sleep(2000);
      console.info("[testRemoteWindow_static_0006] component fontColor strJson:" + JSON.stringify(strJson));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual('#FFCCCCCC');
      console.info("[testRemoteWindow_static_0006] fontColor value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
      done();
    });

    
    /**
     * @tc.number   testRemoteWindow_static_0007
     * @tc.name     testRemoteWindow_static_0007
     * @tc.desc     testRemoteWindow_static_0007
     * @tc.level    Level.LEVEL0
     */
it('testRemoteWindow_static_0007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RemoteWindow testRemoteWindow_static_0007 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      await Utils.sleep(2000);
      console.info("[testRemoteWindow_static_0007] component lineHeight strJson:" + JSON.stringify(strJson));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight')).assertEqual('25.00fp');
      console.info("[testRemoteWindow_static_0007] lineHeight value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('lineHeight'));
      done();
    });

    
    /**
     * @tc.number   testRemoteWindow_static_0009
     * @tc.name     testRemoteWindow_static_0009
     * @tc.desc     testRemoteWindow_static_0009
     * @tc.level    Level.LEVEL0
     */
it('testRemoteWindow_static_0009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RemoteWindow testRemoteWindow009 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      await Utils.sleep(2000);
      console.info("[testRemoteWindow_static_0009] component padding strJson:" + JSON.stringify(strJson));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding')).assertEqual('10.00vp');
      console.info("[testRemoteWindow_static_0009] padding value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('padding'));
      done();
    });

    
    /**
     * @tc.number   testRemoteWindow_static_0010
     * @tc.name     testRemoteWindow_static_0010
     * @tc.desc     testRemoteWindow_static_0010
     * @tc.level    Level.LEVEL0
     */
it('testRemoteWindow_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RemoteWindow testRemoteWindow_static_0010 START');
      await Utils.sleep(2000);
      let strJson = inspector.getInspectorByKey('formComponentFormDimensionWindowBoundsText');
      await Utils.sleep(2000);
      console.info("[testRemoteWindow_static_0010] component textAlign strJson:" + JSON.stringify(strJson));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'))
        .assertEqual('TextAlign.Center');
      console.info("[testRemoteWindow_static_0010] textAlign value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('textAlign'));
      done();
    });
  })
}