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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';

export default function MovingPhotoView() {
  describe('MovingPhotoView',  () => {
    beforeAll(() => {
      
      
      await UtilsTest.startAbility("com.arkui.ace.platform.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("MovingPhotoView beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/MovingPhotoView/MovingPhotoView',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get MovingPhotoView state pages: " + JSON.stringify(pages));
        if (!("MovingPhotoView" == pages.name)) {
          console.info("get MovingPhotoView state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push MovingPhotoView page error: " + err);
        expect().assertFail();
      }
    });

    

    /**
     * @tc.number   MovingPhotoView_static_001
     * @tc.name     MovingPhotoView_static_001
     * @tc.desc     MovingPhotoView_static_001
     * @tc.level    Level.LEVEL3
     */
it('MovingPhotoView_static_001', Level.LEVEL3, async (done: () => void): Promise<void> => {

      console.info('[MovingPhotoView_static_001] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MovingPhotoViewText');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[MovingPhotoView_static_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('start');

      console.info('[MovingPhotoView_static_001] END');
      done();
    });

    

    /**
     * @tc.number   MovingPhotoView_static_002
     * @tc.name     MovingPhotoView_static_002
     * @tc.desc     MovingPhotoView_static_002
     * @tc.level    Level.LEVEL3
     */
it('MovingPhotoView_static_002', Level.LEVEL3, async (done: () => void): Promise<void> => {

      console.info('[MovingPhotoView_002] START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('MovingPhotoViewText2');
      await CommonFunc.sleep(200);
      let obj = JSON.parseJsonElement(strJson);
      console.info("[MovingPhotoView_002] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('stop');

      console.info('[MovingPhotoView_002] END');
      done();
    });





  })
}
