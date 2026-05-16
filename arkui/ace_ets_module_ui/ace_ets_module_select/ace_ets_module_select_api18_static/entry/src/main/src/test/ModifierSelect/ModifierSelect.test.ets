'use static';
/*
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
import events_emitter from '@ohos.events.emitter';
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
 
 export default function ModifierPage() {
   describe('ModifierPage', () => {
     beforeAll(() => {
       
       await UtilsTest.startAbility("com.arkui.ace.select.api18.static", "EntryAbility");
       
     });

     beforeEach(async (): Promise<void> => {
       console.info('ModifierPage beforeEach start');
       let options: router.RouterOptions = {
         url: 'MainAbility/pages/ModifierSelect/ModifierSelect',
       }
       try {
         const router = AppStorage.get<Router>("router") as Router
         router.clear();
         let pages = router.getState();
         console.info('get ModifierPage state pages:' + JSON.stringify(pages));
         if (!('ModifierPage' == pages.name)) {
           console.info('get ModifierPage pages.name:' + JSON.stringify(pages.name));
           router.pushUrl(options);
           await CommonFunc.sleep(2500);
           // console.info('push ModifierPage page result:' + JSON.stringify(result));
         }
       } catch (err) {
         console.error('push ModifierPage page error:' + err);
       }
       console.info('ModifierPage beforeEach end');
     });
 


     
    
/**
     * @tc.number   ModifierSelect_static_001
     * @tc.name     ModifierSelect_static_001
     * @tc.desc     ModifierSelect_static_001
     * @tc.level    Level.LEVEL3
     */
it('ModifierSelect_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {
      // try {
        let Key: string = 'ModifierSelect01'
        let strJson = inspector.getInspectorByKey(Key);
        console.log('ModifierSelect_static_001')
        await CommonFunc.sleep(1000)
        let obj = JSON.parseJsonElement(strJson);
        let objString = obj.getElement('$attrs').tryGetElement('avoidance')
        if (objString) {
          console.info('ModifierSelect_static_001 ' + JSON.stringifyJsonElement(objString!));
        }

      // } catch(ERROR) {
      //   expect().assertFail();
      // }
      done();
     });
 })
}