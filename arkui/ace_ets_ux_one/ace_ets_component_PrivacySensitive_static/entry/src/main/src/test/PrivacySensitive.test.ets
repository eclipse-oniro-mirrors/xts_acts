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

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';

export default function TextPrivacySensitive() {
  describe('ArkUIHDSPrivacySensitiveTest', () => {
    beforeAll(() => {
      console.info("ArkUIHDSPrivacySensitiveTest beforeAll start");
      await UtilsTest.startAbility("com.example.privacysensitivetest.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info('ArkUIHDSPrivacySensitiveTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/privacySensitive',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get ArkUIHDSPrivacySensitiveTest state pages: ' + JSON.stringify(pages));
        if (!('privacySensitive' == pages.name)) {
          console.info('get ArkUIHDSPrivacySensitiveTest pages.name: ' + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push ArkUIHDSPrivacySensitiveTest page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('ArkUIHDSPrivacySensitiveTest beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('ArkUIHDSPrivacySensitiveTest after each called');
    })
   
    
   
    /**
     * @tc.number   ArkUIHDS_Text_privacySensitive_static_0100
     * @tc.name     ArkUIHDS_Text_privacySensitive_static_0100
     * @tc.desc     ArkUIHDS_Text_privacySensitive_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_Text_privacySensitive_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_Text_privacySensitive_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUIHDS_Text_privacySensitive_0100');
          console.info('ArkUIHDS_Text_privacySensitive_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUIHDS_Text_privacySensitive_static_0100 component obj.$attrs.privacySensitive is: " +
          obj.getElement('$attrs').getBoolean('privacySensitive'));
          expect(obj.getElement('$attrs').getBoolean('privacySensitive')).assertTrue();
          console.info('ArkUIHDS_Text_privacySensitive_static_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Text_privacySensitive_static_0100 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    
    /**
     * @tc.number   ArkUIHDS_Text_privacySensitive_static_0200
     * @tc.name     ArkUIHDS_Text_privacySensitive_static_0200
     * @tc.desc     ArkUIHDS_Text_privacySensitive_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_Text_privacySensitive_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_Text_privacySensitive_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUIHDS_Text_privacySensitive_0200');
          console.info('ArkUIHDS_Text_privacySensitive_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUIHDS_Text_privacySensitive_static_0200 component obj.$attrs.privacySensitive is: " +
          obj.getElement('$attrs').getBoolean('privacySensitive'));
          expect(obj.getElement('$attrs').getBoolean('privacySensitive')).assertFalse();
          console.info('ArkUIHDS_Text_privacySensitive_static_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Text_privacySensitive_static_0200 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    
    /**
     * @tc.number   ArkUIHDS_Text_privacySensitive_static_0300
     * @tc.name     ArkUIHDS_Text_privacySensitive_static_0300
     * @tc.desc     ArkUIHDS_Text_privacySensitive_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_Text_privacySensitive_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_Text_privacySensitive_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUIHDS_Text_privacySensitive_0300');
          console.info('ArkUIHDS_Text_privacySensitive_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUIHDS_Text_privacySensitive_static_0300 component obj.$attrs.privacySensitive is: " +
          obj.getElement('$attrs').getBoolean('privacySensitive'));
          expect(obj.getElement('$attrs').getBoolean('privacySensitive')).assertFalse();
          console.info('ArkUIHDS_Text_privacySensitive_static_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Text_privacySensitive_static_0300 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    
    /**
     * @tc.number   ArkUIHDS_Text_privacySensitive_static_0400
     * @tc.name     ArkUIHDS_Text_privacySensitive_static_0400
     * @tc.desc     ArkUIHDS_Text_privacySensitive_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_Text_privacySensitive_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_Text_privacySensitive_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUIHDS_Text_privacySensitive_0400');
          console.info('ArkUIHDS_Text_privacySensitive_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUIHDS_Text_privacySensitive_static_0400 component obj.$attrs.privacySensitive is: " +
          obj.getElement('$attrs').getBoolean('privacySensitive'));
          expect(obj.getElement('$attrs').getBoolean('privacySensitive')).assertFalse();
          console.info('ArkUIHDS_Text_privacySensitive_static_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Text_privacySensitive_static_0400 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    
    /**
     * @tc.number   ArkUIHDS_Image_privacySensitive_static_0100
     * @tc.name     ArkUIHDS_Image_privacySensitive_static_0100
     * @tc.desc     ArkUIHDS_Image_privacySensitive_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_Image_privacySensitive_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_Image_privacySensitive_static_0100 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUIHDS_Image_privacySensitive_0100');
          console.info('ArkUIHDS_Image_privacySensitive_static_0100 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUIHDS_Image_privacySensitive_static_0100 component obj.$attrs.privacySensitive is: " +
          obj.getElement('$attrs').getBoolean('privacySensitive'));
          expect(obj.getElement('$attrs').getBoolean('privacySensitive')).assertTrue();
          console.info('ArkUIHDS_Image_privacySensitive_static_0100 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Image_privacySensitive_static_0100 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    
    /**
     * @tc.number   ArkUIHDS_Image_privacySensitive_static_0200
     * @tc.name     ArkUIHDS_Image_privacySensitive_static_0200
     * @tc.desc     ArkUIHDS_Image_privacySensitive_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_Image_privacySensitive_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_Image_privacySensitive_static_0200 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUIHDS_Image_privacySensitive_0200');
          console.info('ArkUIHDS_Image_privacySensitive_static_0200 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUIHDS_Image_privacySensitive_static_0200 component obj.$attrs.privacySensitive is: " +
          obj.getElement('$attrs').getBoolean('privacySensitive'));
          expect(obj.getElement('$attrs').getBoolean('privacySensitive')).assertFalse();
          console.info('ArkUIHDS_Image_privacySensitive_static_0200 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Image_privacySensitive_static_0200 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    
    /**
     * @tc.number   ArkUIHDS_Image_privacySensitive_static_0300
     * @tc.name     ArkUIHDS_Image_privacySensitive_static_0300
     * @tc.desc     ArkUIHDS_Image_privacySensitive_static_0300
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_Image_privacySensitive_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_Image_privacySensitive_static_0300 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUIHDS_Image_privacySensitive_0300');
          console.info('ArkUIHDS_Image_privacySensitive_static_0300 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUIHDS_Image_privacySensitive_static_0300 component obj.$attrs.privacySensitive is: " +
          obj.getElement('$attrs').getBoolean('privacySensitive'));
          expect(obj.getElement('$attrs').getBoolean('privacySensitive')).assertFalse();
          console.info('ArkUIHDS_Image_privacySensitive_static_0300 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Image_privacySensitive_static_0300 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });

    
    /**
     * @tc.number   ArkUIHDS_Image_privacySensitive_static_0400
     * @tc.name     ArkUIHDS_Image_privacySensitive_static_0400
     * @tc.desc     ArkUIHDS_Image_privacySensitive_static_0400
     * @tc.level    Level.LEVEL1
     */
it('ArkUIHDS_Image_privacySensitive_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ArkUIHDS_Image_privacySensitive_static_0400 START');
      setTimeout(() => {
        try {
          let strJson = inspector.getInspectorByKey('ArkUIHDS_Image_privacySensitive_0400');
          console.info('ArkUIHDS_Image_privacySensitive_static_0400 START  :' + JSON.stringify(strJson));
          let obj = JSON.parseJsonElement(strJson);
          console.info("ArkUIHDS_Image_privacySensitive_static_0400 component obj.$attrs.privacySensitive is: " +
          obj.getElement('$attrs').getBoolean('privacySensitive'));
          expect(obj.getElement('$attrs').getBoolean('privacySensitive')).assertFalse();
          console.info('ArkUIHDS_Image_privacySensitive_static_0400 END ');
          done();
        } catch (err) {
          console.info('ArkUIHDS_Image_privacySensitive_static_0400 ERR ' + JSON.stringify(err));
          expect().assertFail();
        }
      }, 500)
    });
  })
}
