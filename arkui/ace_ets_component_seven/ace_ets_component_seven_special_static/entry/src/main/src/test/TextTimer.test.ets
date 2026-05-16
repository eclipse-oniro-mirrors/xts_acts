'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index'
import router from '@ohos.router'
import Utils from '../../ets/MainAbility/common/Utils';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'

export default function textTimer() {
  describe('textTimerJsunit', () => {
    beforeAll(() => {
        console.info("textTimerJsunit beforeEach start");
        await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("textTimerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/textTimer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get textTimer state pages: " + JSON.stringify(pages));
        if (!("textTimer" == pages.name)) {
          console.info("get textTimer state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push textTimer page error: " + err);
      }
    });

  
    
    
/**
     * @tc.number   textTimerJsunit_static_0100
     * @tc.name     textTimerJsunit_static_0100
     * @tc.desc     textTimerJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0100 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0100] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFC0CB');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('mm:ss.SS');
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('cursive');
      
      console.info('textTimerJsunit_static_0100 END');
      done();
    });

   
    
    
/**
     * @tc.number   textTimerJsunit_static_0101
     * @tc.name     textTimerJsunit_static_0101
     * @tc.desc     textTimerJsunit_static_0101
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0101 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0101] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFC0CB');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('mm:ss.SS');
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('cursive');
      
      console.info('textTimerJsunit_static_0101 END');
      done();
    });

   
    
    
/**
     * @tc.number   textTimerJsunit_static_0102
     * @tc.name     textTimerJsunit_static_0102
     * @tc.desc     textTimerJsunit_static_0102
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0102', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0102 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0102] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFC0CB');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('mm:ss.SS');
      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('cursive');
      
      console.info('textTimerJsunit_static_0102 END');
      done();
    });

   
    
    
/**
     * @tc.number   textTimerJsunit_static_0103
     * @tc.name     textTimerJsunit_static_0103
     * @tc.desc     textTimerJsunit_static_0103
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0103', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0103 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0103] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('20.00fp');
      console.info('textTimerJsunit_static_0103 END');
      done();
    });

   
    
    
/**
     * @tc.number   textTimerJsunit_static_0200
     * @tc.name     textTimerJsunit_static_0200
     * @tc.desc     textTimerJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0200 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0200] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FFFFC0CB');

      console.info('textTimerJsunit_static_0200 END');
      done();
    });

   
    
    
/**
     * @tc.number   textTimerJsunit_static_0300
     * @tc.name     textTimerJsunit_static_0300
     * @tc.desc     textTimerJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0300 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0300] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('format')).assertEqual('mm:ss.SS');
      
      console.info('textTimerJsunit_static_0300 END');
      done();
    });

   
    
    
/**
     * @tc.number   textTimerJsunit_static_0400
     * @tc.name     textTimerJsunit_static_0400
     * @tc.desc     textTimerJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0400 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0400] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      
      console.info('textTimerJsunit_static_0400 END');
      done();
    });

   
    
    
/**
     * @tc.number   textTimerJsunit_static_0500
     * @tc.name     textTimerJsunit_static_0500
     * @tc.desc     textTimerJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0500 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0500] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('fontStyle')).assertEqual('FontStyle.Italic');
      
      console.info('textTimerJsunit_static_0500 END');
      done();
    });

  
    
    
/**
     * @tc.number   textTimerJsunit_static_0600
     * @tc.name     textTimerJsunit_static_0600
     * @tc.desc     textTimerJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('textTimerJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('textTimerJsunit_static_0600 START');
      let strJson = inspector.getInspectorByKey('TextTimerKey1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[textTimerJsunit_static_0600] obj is: " + JSON.stringify(obj.getElement('$attrs')));

      expect(obj.getElement('$attrs').getString('fontFamily')).assertEqual('cursive');
      
      console.info('textTimerJsunit_static_0600 END');
      done();
    });

  })
}
