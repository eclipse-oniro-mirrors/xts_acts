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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from './Util.test'
import emitter from '@ohos.events.emitter';
import { SheetSize, BlurStyle, SheetType } from '@ohos.arkui.component'

class TitleSub {
  title: string = ''
  subtitle: string = ''
}

export default function ModelSheetTest() {
  describe('ModelSheetTest', () => {
    beforeAll(() => {
      console.info("ModelSheetTest beforeAll start");
      
      await UtilsTest.startAbility("com.example.ModelSheet.static", "EntryAbility")
      
    });

    beforeEach(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ModelSheet',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Index state success " + JSON.stringify(pages));
        if (!("ModelSheet" == pages.name)) {
          console.info("get Index state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await UtilsTest.msSleep(2000)
        }
      } catch (err) {
        console.error("push Index page error: " + err);
      }
    });


    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0150
     * @tc.name     ArkUX_Model_Visual_static_0150
     * @tc.desc     ArkUX_Model_Visual_static_0150
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0150', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_static_0150 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10150,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_static_0150 get state result is: " + JSON.stringify(indexData));
          expect(((indexData.data) as ESObject)!.getProperty('detents'))
            .assertEqual([SheetSize.LARGE, SheetSize.MEDIUM, SheetSize.MEDIUM]);
          expect(((indexData.data) as ESObject)!.getProperty('blurStyle')).assertEqual(BlurStyle.Thin);
          expect(((indexData.data) as ESObject)!.getProperty('showClose')).assertEqual(false);
          expect(((indexData.data) as ESObject)!.getProperty('title')).assertEqual({
            title: "323", subtitle: "156"
          } as TitleSub);
          expect(((indexData.data) as ESObject)!.getProperty('preferType')).assertEqual(SheetType.POPUP);
          expect(((indexData.data) as ESObject)!.getProperty('shouldDismiss')).assertEqual(true);
          expect(((indexData.data) as ESObject)!.getProperty('enableOutsideInteractive')).assertEqual(false)
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_static_0150 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_static_0150', 10, "")
        console.info("ArkUX_Model_Visual_static_0150 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_static_0150', 10, "")));
        console.info('ArkUX_Model_Visual_static_0150 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_static_0150 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0160
     * @tc.name     ArkUX_Model_Visual_static_0160
     * @tc.desc     ArkUX_Model_Visual_static_0160
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0160', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_static_0160 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10160,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_static_0160 get state result is: " + JSON.stringify(indexData));
          expect(((indexData.data) as ESObject)!.getProperty('detents'))
            .assertEqual([SheetSize.MEDIUM, SheetSize.LARGE, 100]);
          expect(((indexData.data) as ESObject)!.getProperty('blurStyle')).assertEqual(BlurStyle.Thick);
          expect(((indexData.data) as ESObject)!.getProperty('showClose')).assertEqual(true);
          expect(((indexData.data) as ESObject)!.getProperty('title')).assertEqual({
            title: "title", subtitle: "subtitle"
          } as TitleSub);
          expect(((indexData.data) as ESObject)!.getProperty('preferType')).assertEqual(SheetType.CENTER);
          expect(((indexData.data) as ESObject)!.getProperty('shouldDismiss')).assertEqual(true);
          expect(((indexData.data) as ESObject)!.getProperty('enableOutsideInteractive')).assertEqual(true)
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_static_0160 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_static_0160', 10, "")
        console.info("ArkUX_Model_Visual_static_0160 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_static_0160', 10, "")));
        console.info('ArkUX_Model_Visual_static_0160 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_static_0160 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0170
     * @tc.name     ArkUX_Model_Visual_static_0170
     * @tc.desc     ArkUX_Model_Visual_static_0170
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0170', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_static_0170 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10170,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_static_0170 get state result is: " + JSON.stringify(indexData));
          expect(((indexData.data) as ESObject)!.getProperty('detents')).assertEqual([100, 100, SheetSize.LARGE]);
          expect(((indexData.data) as ESObject)!.getProperty('blurStyle')).assertEqual(BlurStyle.Regular);
          expect(((indexData.data) as ESObject)!.getProperty('showClose')).assertEqual(false);
          expect(((indexData.data) as ESObject)!.getProperty('title')).assertEqual({
            title: "asdasd", subtitle: "1232561"
          } as TitleSub);
          expect(((indexData.data) as ESObject)!.getProperty('preferType')).assertEqual(SheetType.POPUP);
          expect(((indexData.data) as ESObject)!.getProperty('shouldDismiss')).assertEqual(true);
          expect(((indexData.data) as ESObject)!.getProperty('enableOutsideInteractive')).assertEqual(false)
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_static_0170 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_static_0170', 10, "")
        console.info("ArkUX_Model_Visual_static_0170 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_static_0170', 10, "")));
        console.info('ArkUX_Model_Visual_static_0170 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_static_0170 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0180
     * @tc.name     ArkUX_Model_Visual_static_0180
     * @tc.desc     ArkUX_Model_Visual_static_0180
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0180', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_static_0180 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10180,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_static_0180 get state result is: " + JSON.stringify(indexData));
          expect(((indexData.data) as ESObject)!.getProperty('detents')).assertEqual([0, 0, 0]);
          expect(((indexData.data) as ESObject)!.getProperty('blurStyle')).assertEqual(BlurStyle.BACKGROUND_REGULAR);
          expect(((indexData.data) as ESObject)!.getProperty('showClose')).assertEqual(true);
          expect(((indexData.data) as ESObject)!.getProperty('title')).assertEqual({
            title: " ", subtitle: " "
          } as TitleSub);
          expect(((indexData.data) as ESObject)!.getProperty('preferType')).assertEqual(SheetType.CENTER);
          expect(((indexData.data) as ESObject)!.getProperty('shouldDismiss')).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_static_0180 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_static_0180', 10, "")
        console.info("ArkUX_Model_Visual_static_0180 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_static_0180', 10, "")));
        console.info('ArkUX_Model_Visual_static_0180 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_static_0180 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0190
     * @tc.name     ArkUX_Model_Visual_static_0190
     * @tc.desc     ArkUX_Model_Visual_static_0190
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0190', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_static_0190 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10190,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_static_0190 get state result is: " + JSON.stringify(indexData));
          // expect(((indexData.data) as ESObject)!.getProperty('detents')).assertEqual([, ,]);
          expect(((indexData.data) as ESObject)!.getProperty('blurStyle')).assertEqual(" ");
          expect(((indexData.data) as ESObject)!.getProperty('showClose')).assertEqual(" ");
          expect(((indexData.data) as ESObject)!.getProperty('title')).assertEqual({
            title: " ", subtitle: " "
          } as TitleSub);
          expect(((indexData.data) as ESObject)!.getProperty('preferType')).assertEqual(" ");
          expect(((indexData.data) as ESObject)!.getProperty('shouldDismiss')).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_static_0190 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_static_0190', 10, "")
        console.info("ArkUX_Model_Visual_static_0190 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_static_0190', 10, "")));
        console.info('ArkUX_Model_Visual_static_0190 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_static_0190 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0200
     * @tc.name     ArkUX_Model_Visual_static_0200
     * @tc.desc     ArkUX_Model_Visual_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_static_0200 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10200,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_static_0200 get state result is: " + JSON.stringify(indexData));
          expect(((indexData.data) as ESObject)!.getProperty('detents'))
            .assertEqual([SheetSize.LARGE, 10000, SheetSize.MEDIUM]);
          expect(((indexData.data) as ESObject)!.getProperty('blurStyle')).assertEqual(BlurStyle.BACKGROUND_THIN);
          expect(((indexData.data) as ESObject)!.getProperty('showClose')).assertEqual(false);
          expect(((indexData.data) as ESObject)!.getProperty('title')).assertEqual({
            title: "标题", subtitle: "文字"
          } as TitleSub);
          expect(((indexData.data) as ESObject)!.getProperty('preferType')).assertEqual(SheetType.POPUP);
          expect(((indexData.data) as ESObject)!.getProperty('shouldDismiss')).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_static_0200 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_static_0200', 10, "")
        console.info("ArkUX_Model_Visual_static_0200 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_static_0200', 10, "")));
        console.info('ArkUX_Model_Visual_static_0200 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_static_0200 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0210
     * @tc.name     ArkUX_Model_Visual_static_0210
     * @tc.desc     ArkUX_Model_Visual_static_0210
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0210', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_static_0210 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10210,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_static_0210 get state result is: " + JSON.stringify(indexData));
          expect(((indexData.data) as ESObject)!.getProperty('detents')).assertEqual([0, 100, 12345]);
          expect(((indexData.data) as ESObject)!.getProperty('blurStyle'))
            .assertEqual(BlurStyle.BACKGROUND_ULTRA_THICK);
          expect(((indexData.data) as ESObject)!.getProperty('showClose')).assertEqual(false);
          expect(((indexData.data) as ESObject)!.getProperty('title')).assertEqual({
            title: "@@@", subtitle: "+++"
          } as TitleSub);
          expect(((indexData.data) as ESObject)!.getProperty('preferType')).assertEqual(SheetType.POPUP);
          expect(((indexData.data) as ESObject)!.getProperty('shouldDismiss')).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_static_0210 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_static_0210', 10, "")
        console.info("ArkUX_Model_Visual_static_0210 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_static_0210', 10, "")));
        console.info('ArkUX_Model_Visual_static_0210 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_static_0210 ERR  ' + JSON.stringify(err));
      }
      done();
    });


    
    /**
     * @tc.number   ArkUX_Model_Visual_static_0220
     * @tc.name     ArkUX_Model_Visual_static_0220
     * @tc.desc     ArkUX_Model_Visual_static_0220
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Model_Visual_static_0220', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Model_Visual_static_0220 START');
      try {
        let indexEvent: emitter.InnerEvent = {
          eventId: 10220,
          priority: emitter.EventPriority.LOW
        }
        let callback = (indexData: emitter.EventData) => {
          console.info("ArkUX_Model_Visual_static_0220 get state result is: " + JSON.stringify(indexData));
          expect(((indexData.data) as ESObject)!.getProperty('detents')).assertEqual([54321, 11111, 123456]);
          expect(((indexData.data) as ESObject)!.getProperty('blurStyle')).assertEqual(BlurStyle.NONE);
          expect(((indexData.data) as ESObject)!.getProperty('showClose')).assertEqual(true);
          expect(((indexData.data) as ESObject)!.getProperty('title')).assertEqual({
            title: "。。。", subtitle: "，，，"
          } as TitleSub);
          expect(((indexData.data) as ESObject)!.getProperty('preferType')).assertEqual(SheetType.CENTER);
          expect(((indexData.data) as ESObject)!.getProperty('shouldDismiss')).assertEqual(true);
          done();
        }
        try {
          emitter.on(indexEvent, callback);
        } catch (err) {
          console.info("ArkUX_Model_Visual_static_0220 on emitter err : " + JSON.stringify(err));
        }
        inspector.sendEventByKey('ArkUX_Model_Visual_static_0220', 10, "")
        console.info("ArkUX_Model_Visual_static_0220 click result is: " +
        JSON.stringify(inspector.sendEventByKey('ArkUX_Model_Visual_static_0220', 10, "")));
        console.info('ArkUX_Model_Visual_static_0220 END ');
      } catch (err) {
        expect().assertFail()
        console.info('ArkUX_Model_Visual_static_0220 ERR  ' + JSON.stringify(err));
      }
      done();
    });

  })
}