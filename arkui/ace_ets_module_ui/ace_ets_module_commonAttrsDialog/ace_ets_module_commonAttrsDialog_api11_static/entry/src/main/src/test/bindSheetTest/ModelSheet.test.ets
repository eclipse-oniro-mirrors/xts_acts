'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import emitter from '@ohos.events.emitter';
import { BlurStyle, SheetSize, SheetType } from '@ohos.arkui.component'
import { UtilsTest } from '../Util.test'
import { RecordData } from '@ohos.base';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ModelSheetTest() {
  describe('ModelSheetTest', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsDialog.api11.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("ModelSheetTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheet/Index',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Index state pages:" + JSON.stringify(pages));
        if (!("Index" == pages.name)) {
          console.info("get Index pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ModelSheetTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Index page error:" + err);
      }
      console.info("Index beforeEach end");
    });

    
    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0150
     * @tc.name     ArkUX_Model_Visual_static_0150
     * @tc.desc     ArkUX_Model_Visual_static_0150
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0150', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_0150 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10150,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          const event: Record<String,RecordData> =
            indexData.data as Record<String,RecordData>
          console.info("ArkUX_Model_Visual_0150 get state result is: " + JSON.stringify(indexData));
          expect(event['detents'])
            .assertEqual([SheetSize.LARGE, SheetSize.MEDIUM, SheetSize.MEDIUM]);
          expect(event['blurStyle']).assertEqual(BlurStyle.Thin);
          expect(event['showClose']).assertEqual(false);
          expect(event['title']).assertEqual("323");
          expect(event['preferType']).assertEqual(SheetType.POPUP);
          expect(event['shouldDismiss']).assertEqual(true);
          expect(event['enableOutsideInteractive']).assertEqual(false)
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0150 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_0150', 10, "")
        console.info("ArkUX_Model_Visual_0150 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_0150', 10, "")));
        console.info('ArkUX_Model_Visual_0150 END ');
        done();
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0150 ERR  ' + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0160
     * @tc.name     ArkUX_Model_Visual_static_0160
     * @tc.desc     ArkUX_Model_Visual_static_0160
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0160', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_0160 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10160,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          const event: Record<String,RecordData> =
            indexData.data as Record<String,RecordData>
          console.info("ArkUX_Model_Visual_0160 get state result is: " + JSON.stringify(indexData));
          expect(event['detents'])
            .assertEqual([SheetSize.MEDIUM, SheetSize.LARGE, 100]);
          expect(event['blurStyle']).assertEqual(BlurStyle.Thick);
          expect(event['showClose']).assertEqual(true);
          expect(event['title']).assertEqual("title");
          expect(event['preferType']).assertEqual(SheetType.CENTER);
          expect(event['shouldDismiss']).assertEqual(true);
          expect(event['enableOutsideInteractive']).assertEqual(true)
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0160 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_0160', 10, "")
        console.info("ArkUX_Model_Visual_0160 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_0160', 10, "")));
        console.info('ArkUX_Model_Visual_0160 END ');
        done();
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0160 ERR  ' + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0170
     * @tc.name     ArkUX_Model_Visual_static_0170
     * @tc.desc     ArkUX_Model_Visual_static_0170
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0170', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_0170 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10170,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          const event: Record<String,RecordData> =
            indexData.data as Record<String,RecordData>
          console.info("ArkUX_Model_Visual_0170 get state result is: " + JSON.stringify(indexData));
          expect(event['detents']).assertEqual([100, 100, SheetSize.LARGE]);
          expect(event['blurStyle']).assertEqual(BlurStyle.Regular);
          expect(event['showClose']).assertEqual(false);
          expect(event['title']).assertEqual("asdasd");
          expect(event['preferType']).assertEqual(SheetType.POPUP);
          expect(event['shouldDismiss']).assertEqual(true);
          expect(event['enableOutsideInteractive']).assertEqual(false)
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0170 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_0170', 10, "")
        console.info("ArkUX_Model_Visual_0170 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_0170', 10, "")));
        console.info('ArkUX_Model_Visual_0170 END ');
        done();
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0170 ERR  ' + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0180
     * @tc.name     ArkUX_Model_Visual_static_0180
     * @tc.desc     ArkUX_Model_Visual_static_0180
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0180', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_0180 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10180,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          const event: Record<String,RecordData> =
            indexData.data as Record<String,RecordData>
          console.info("ArkUX_Model_Visual_0180 get state result is: " + JSON.stringify(indexData));
          expect(event['detents']).assertEqual([0, 0, 0]);
          expect(event['blurStyle']).assertEqual(BlurStyle.BACKGROUND_REGULAR);
          expect(event['showClose']).assertEqual(true);
          expect(event['title']).assertEqual(" ");
          expect(event['preferType']).assertEqual(SheetType.CENTER);
          expect(event['shouldDismiss']).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0180 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_0180', 10, "")
        console.info("ArkUX_Model_Visual_0180 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_0180', 10, "")));
        console.info('ArkUX_Model_Visual_0180 END ');
        done();
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0180 ERR  ' + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0190
     * @tc.name     ArkUX_Model_Visual_static_0190
     * @tc.desc     ArkUX_Model_Visual_static_0190
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0190', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_0190 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10190,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          const event: Record<String,RecordData> =
            indexData.data as Record<String,RecordData>
          console.info("ArkUX_Model_Visual_0190 get state result is: " + JSON.stringify(indexData));
          // expect(event['detents']).assertEqual([, ,]);
          expect(event['blurStyle']).assertEqual(" ");
          expect(event['showClose']).assertEqual(" ");
          // expect(event['title']).assertEqual({
          //   title: " ", subtitle: " "
          // });
          expect(event['preferType']).assertEqual(" ");
          expect(event['shouldDismiss']).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0190 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_0190', 10, "")
        console.info("ArkUX_Model_Visual_0190 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_0190', 10, "")));
        console.info('ArkUX_Model_Visual_0190 END ');
        done();
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0190 ERR  ' + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0200
     * @tc.name     ArkUX_Model_Visual_static_0200
     * @tc.desc     ArkUX_Model_Visual_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_0200 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10200,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          const event: Record<String,RecordData> =
            indexData.data as Record<String,RecordData>
          console.info("ArkUX_Model_Visual_0200 get state result is: " + JSON.stringify(indexData));
          expect(event['detents'])
            .assertEqual([SheetSize.LARGE, 10000, SheetSize.MEDIUM]);
          expect(event['blurStyle']).assertEqual(BlurStyle.BACKGROUND_THIN);
          expect(event['showClose']).assertEqual(false);
          expect(event['title']).assertEqual("标题");
          expect(event['preferType']).assertEqual(SheetType.POPUP);
          expect(event['shouldDismiss']).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0200 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_0200', 10, "")
        console.info("ArkUX_Model_Visual_0200 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_0200', 10, "")));
        console.info('ArkUX_Model_Visual_0200 END ');
        done();
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0200 ERR  ' + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0210
     * @tc.name     ArkUX_Model_Visual_static_0210
     * @tc.desc     ArkUX_Model_Visual_static_0210
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0210', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_0210 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10210,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          const event: Record<String,RecordData> =
            indexData.data as Record<String,RecordData>
          console.info("ArkUX_Model_Visual_0210 get state result is: " + JSON.stringify(indexData));
          expect(event['detents']).assertEqual([0, 100, 12345]);
          expect(event['blurStyle'])
            .assertEqual(BlurStyle.BACKGROUND_ULTRA_THICK);
          expect(event['showClose']).assertEqual(false);
          expect(event['title']).assertEqual("@@@");
          expect(event['preferType']).assertEqual(SheetType.POPUP);
          expect(event['shouldDismiss']).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0210 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_0210', 10, "")
        console.info("ArkUX_Model_Visual_0210 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_0210', 10, "")));
        console.info('ArkUX_Model_Visual_0210 END ');
        done();
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0210 ERR  ' + JSON.stringify(err));
      }
    });

    
    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0220
     * @tc.name     ArkUX_Model_Visual_static_0220
     * @tc.desc     ArkUX_Model_Visual_static_0220
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_0220 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10220,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          const event: Record<String,RecordData> =
            indexData.data as Record<String,RecordData>
          console.info("ArkUX_Model_Visual_0220 get state result is: " + JSON.stringify(indexData));
          expect(event['detents']).assertEqual([54321, 11111, 123456]);
          expect(event['blurStyle']).assertEqual(BlurStyle.NONE);
          expect(event['showClose']).assertEqual(true);
          expect(event['title']).assertEqual("。。。");
          expect(event['preferType']).assertEqual(SheetType.CENTER);
          expect(event['shouldDismiss']).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_0220 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_0220', 10, "")
        console.info("ArkUX_Model_Visual_0220 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_0220', 10, "")));
        console.info('ArkUX_Model_Visual_0220 END ');
        done();
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_0220 ERR  ' + JSON.stringify(err));
      }
    });

  })
}