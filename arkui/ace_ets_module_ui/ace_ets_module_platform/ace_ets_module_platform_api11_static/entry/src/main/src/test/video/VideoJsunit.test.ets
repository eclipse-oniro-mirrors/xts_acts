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

function sleep(time: int) {
  return new Promise<int>((resolve,reject) => {
    setTimeout(() => {
      resolve(0)
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function videoJsunit() {


  describe('VideoAppInfoTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.platform.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/video/Video',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await sleep(1);
        let pages = routerInstance.getState();
        console.info("get Video state success " + JSON.stringify(pages));
        if (!("Video" == pages.name)) {
          console.info("get Video state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error("push Video page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async (): Promise<void> => {
      console.info("Video after each called");
      await sleep(1)
    });

    
    /**
     * @tc.number   videoAppInfoStaticTest001
     * @tc.name     videoAppInfoStaticTest001
     * @tc.desc     videoAppInfoStaticTest001
     * @tc.level    Level.LEVEL1
     */
it('videoAppInfoStaticTest001', Level.LEVEL1, async () => {
      console.info('videoAppInfoTest001 START');
      await sleep(1)
     try{
       let strJson = inspector.getInspectorByKey('video');
       let obj = JSON.parseJsonElement(strJson);
       console.info("cd video component obj is: " + strJson);
       console.log("cd video $type" + obj.getString('$type'));
       console.log("cd video $attrs" + JSON.stringifyJsonElement(obj.getElement('$attrs')));
       console.log("cd video autoPlay" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('autoPlay'));
       console.log("cd video muted" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('muted'));
       console.log("cd video controls" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('controls'));
       console.log("cd video loop" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('loop'));
       console.log("cd video objectFit" + JSON.parseJsonElement(strJson).getElement('$attrs').getString('objectFit'));
     }catch(e){
        expect().assertFail()
     }
      console.info('videoAppInfoTest001 END');
    });
  })
}
