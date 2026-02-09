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
import { describe, beforeEach, afterEach,  it, Level, expect, beforeAll } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import {UtilsTest,startAbility} from '../Util.test'

export default function UIContextComponentSnapshotJsunit() {
  describe('UIContextComponentSnapshotTest', () => {
    beforeAll(() => {
      console.info("UIContextComponentSnapshotTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.example.myapplication.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info('UIContextComponentSnapshotTest beforeEach start');
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/xts/UIContextComponentSnapshot',
      }
      try {
        const router = AppStorage.get<Router>("router" ) as Router
        router.clear();
        let pages = router.getState();
        console.info('get UIContextComponentSnapshot state pages:' + JSON.stringify(pages));
        if (!('UIContextComponentSnapshot' == pages.name)) {
          console.info('get UIContextComponentSnapshot state pages.name:' + JSON.stringify(pages.name));
          
          router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error('push UIContextComponentSnapshot page error:' + JSON.stringify(err));
      }
    });
    afterEach(async () => {
      await Utils.sleep(1000);
      console.info('UIContextComponentSnapshot after each called');
    });
    
    


/**
     * @tc.number   UIContextComponentSnapshotTest_static_0100
     * @tc.name     UIContextComponentSnapshotTest_static_0100
     * @tc.desc     UIContextComponentSnapshotTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('UIContextComponentSnapshotTest_static_0100', Level.LEVEL0, async (done: ()=>void) => {

      console.info('UIContextComponentSnapshotTest_0100 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('getComponentSnapshot_01'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let text =  inspector.getInspectorByKey('key_getComponentSnapshot_text_01');
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('snapshot');//UIContextComponentSnapshotTest_static_0100, expect  equals snapshot
      console.info('UIContextComponentSnapshotTest_0100 END');
      done();
    });
    
    


/**
     * @tc.number   UIContextComponentSnapshotTest_static_0200
     * @tc.name     UIContextComponentSnapshotTest_static_0200
     * @tc.desc     UIContextComponentSnapshotTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('UIContextComponentSnapshotTest_static_0200', Level.LEVEL0, async (done: ()=>void) => {

      console.info('UIContextComponentSnapshotTest_0200 START');
      let driver1 = Driver.create();
      let button = await driver1.findComponent(ON.id('getComponentSnapshot_02'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
      let text =  inspector.getInspectorByKey('key_getComponentSnapshot_text_02');
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('snapshot');
      console.info('UIContextComponentSnapshotTest_0200 END');
      done();
    });
  })
}