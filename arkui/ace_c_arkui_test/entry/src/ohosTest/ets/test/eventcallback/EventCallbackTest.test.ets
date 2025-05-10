/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@kit.TestKit';

export default function eventCallbackTest() {

  describe('EventCallbackTest', () => {

    beforeAll(async (done: Function) => {
      await Utils.sleep(2000);
      done();
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_EVENT_CALLBACK_0100
    * @tc.name       : testEventCallback001
    * @tc.desc       : testing addNodeEventReceiver with nomral value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEventCallback001', 0, async (done: Function) => {
      let PAGE_TAG = 'EventCallbackAddReceiverTest';
      await Utils.pushPage(`eventcallback/${PAGE_TAG}`);
      await Utils.clickComponent('AddReceiver');
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('AddReceiver').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_EVENT_CALLBACK_0200
    * @tc.name       : testEventCallback002
    * @tc.desc       : testing removeNodeEventReceiver with nomral value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEventCallback002', 0, async (done: Function) => {
      let PAGE_TAG = 'EventCallbackRemoveReceiverTest';
      await Utils.pushPage(`eventcallback/${PAGE_TAG}`);
      await Utils.clickComponent('RemoveReceiver');
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('RemoveReceiver').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_EVENT_CALLBACK_0300
    * @tc.name       : testEventCallback003
    * @tc.desc       : testing registerNodeEvent with nomral value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEventCallback003', 0, async (done: Function) => {
      let PAGE_TAG = 'EventCallbackRegisterEventTest';
      await Utils.pushPage(`eventcallback/${PAGE_TAG}`);
      await Utils.clickComponent('RegisterEvent');
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('RegisterEvent').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_EVENT_CALLBACK_0400
    * @tc.name       : testEventCallback004
    * @tc.desc       : testing unregisterNodeEvent with nomral value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEventCallback004', 0, async (done: Function) => {
      let PAGE_TAG = 'EventCallbackUnregisterEventTest';
      await Utils.pushPage(`eventcallback/${PAGE_TAG}`);
      await Utils.clickComponent('UnregisterEvent');
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('UnregisterEvent').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_EVENT_CALLBACK_0500
    * @tc.name       : testEventCallback005
    * @tc.desc       : testing registerNodeEventReceiver with nomral value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEventCallback005', 0, async (done: Function) => {
      let PAGE_TAG = 'EventCallbackRegisterReceiverTest';
      await Utils.pushPage(`eventcallback/${PAGE_TAG}`);
      await Utils.clickComponent('RegisterReceiver');
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('RegisterReceiver').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_EVENT_CALLBACK_0600
    * @tc.name       : testEventCallback006
    * @tc.desc       : testing unregisterNodeEventReceiver with nomral value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEventCallback006', 0, async (done: Function) => {
      let PAGE_TAG = 'EventCallbackUnregisterReceiverTest';
      await Utils.pushPage(`eventcallback/${PAGE_TAG}`);
      await Utils.clickComponent('UnregisterReceiver');
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('UnregisterReceiver').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_EVENT_CALLBACK_0700
    * @tc.name       : testEventCallback007
    * @tc.desc       : testing addNodeEventReceiver with abnomral value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEventCallback007', 0, async (done: Function) => {
      let PAGE_TAG = 'EventCallbackAddReceiver401Test';
      await Utils.pushPage(`eventcallback/${PAGE_TAG}`);
      await Utils.clickComponent('AddReceiver');
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('AddReceiver').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_EVENT_CALLBACK_0800
    * @tc.name       : testEventCallback008
    * @tc.desc       : testing removeNodeEventReceiver with abnomral value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEventCallback008', 0, async (done: Function) => {
      let PAGE_TAG = 'EventCallbackRemoveReceiver401Test';
      await Utils.pushPage(`eventcallback/${PAGE_TAG}`);
      await Utils.clickComponent('RemoveReceiver');
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('RemoveReceiver').$attrs.backgroundColor).assertEqual('#FFFF0000')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_EVENT_CALLBACK_0900
    * @tc.name       : testEventCallback009
    * @tc.desc       : testing registerNodeEvent with abnomral value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEventCallback009', 0, async (done: Function) => {
      let PAGE_TAG = 'EventCallbackRegisterEvent401Test';
      await Utils.pushPage(`eventcallback/${PAGE_TAG}`);
      await Utils.clickComponent('RegisterEvent');
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('RegisterEvent').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_EVENT_CALLBACK_1000
    * @tc.name       : testEventCallback010
    * @tc.desc       : testing registerNodeEvent with abnomral value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEventCallback010', 0, async (done: Function) => {
      let PAGE_TAG = 'EventCallbackRegisterEvent001Test';
      await Utils.pushPage(`eventcallback/${PAGE_TAG}`);
      await Utils.clickComponent('RegisterEvent');
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('RegisterEvent').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

    /*
    * @tc.number     : SUB_ARKUI_CAPI_EVENT_CALLBACK_1100
    * @tc.name       : testEventCallback011
    * @tc.desc       : testing registerNodeEvent with abnomral value
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testEventCallback011', 0, async (done: Function) => {
      let PAGE_TAG = 'EventCallbackRegisterEvent002Test';
      await Utils.pushPage(`eventcallback/${PAGE_TAG}`);
      await Utils.clickComponent('RegisterEvent');
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('RegisterEvent').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })
  })
}