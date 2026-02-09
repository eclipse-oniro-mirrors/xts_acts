'use static';
/**
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
import { TextAlign, TextOverflow } from '@ohos.arkui.component'
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from "../../../../hypium/index";
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManagerBase, CallbackBase } from '../../../ets/MainAbility/common/MessageManager2';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const uiContext = new UIContext();

export default function text3Jsunit() {
  describe('text3Jsunit', () => {
    beforeAll(() => {
      console.info("text3Jsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("text3Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/text3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get text3Jsunit state pages:" + JSON.stringify(pages));
        if (!("text3" == pages.name)) {
          console.info("get text3Jsunit pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push text3Jsunit page error:" + err);
      }
      console.info("text3Jsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("text after each called");
    });
    // let resourceSize = getContext().resourceManager.getNumber($r('sys.float.ohos_id_text_font_size').id)

    
    /**
     * @tc.number   testText_static_0100
     * @tc.name     testText_static_0100
     * @tc.desc     testText_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('testText_static_0100', Level.LEVEL2, async (done: () => void) => {
      console.info('testText_static_0100 START');
      let strJson = inspector.getInspectorByKey('text');
      console.info("testText_static_0100 component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontSize')).assertEqual('9.00fp');
      console.info('testText_static_0100 END');
      done();
    });

    
    /**
     * @tc.number   testText_static_0200
     * @tc.name     testText_static_0200
     * @tc.desc     testText_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('testText_static_0200', Level.LEVEL2, async (done: () => void) => {
      console.info('testText_static_0200 START');
      let strJson = inspector.getInspectorByKey('image');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testText_static_0200 component strJson:" + strJson);
      console.info("testText_static_0200 component strJson:" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('src'));
      expect(obj.getElement('$attrs').getString('src')).assertEqual('resource://rawfile/test.png');
      console.info('testText_static_0200 END');
      done();
    });

    
    /**
     * @tc.number   testText_static_0300
     * @tc.name     testText_static_0300
     * @tc.desc     testText_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('testText_static_0300', Level.LEVEL2, async (done: () => void) => {
      console.info('testText_static_0300 START');
      try {
        const message: MessageManagerBase<string> = AppStorage.get<MessageManagerBase<string>>("messageManagerString")!
        message.notify({name:'fontSize',value:"10"});
      } catch (err) {
        console.log("testText_static_0300 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('text');

      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontSize')).assertEqual('10.00fp');
      console.info('testText_static_0300 END');
      done();
    });

    
    /**
     * @tc.number   testText_static_0400
     * @tc.name     testText_static_0400
     * @tc.desc     testText_static_0400
     * @tc.level    Level.LEVEL2
     */
    it('testText_static_0400', Level.LEVEL2, async (done: () => void) => {
      console.info('testText_static_0400 START');
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testText_static_0400 component strJson:" + strJson);
      console.info("testText_static_0400 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#330A59F8');
      console.info('testText_static_0400 END');
      done();
    });

    
    /**
     * @tc.number   testText_static_0500
     * @tc.name     testText_static_0500
     * @tc.desc     testText_static_0500
     * @tc.level    Level.LEVEL2
     */
    it('testText_static_0500', Level.LEVEL2, async (done: () => void) => {
      console.info('testText_static_0500 START');
      try {
        const message: MessageManagerBase<string> = AppStorage.get<MessageManagerBase<string>>("messageManagerString")!
        message.notify({name:'fontColor',value:"#330A59F7"});
      } catch (err) {
        console.log("testText_static_0500 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew = inspector.getInspectorByKey('text');

      console.info("testText_static_0500 component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontColor')).assertEqual('#330A59F7');
      console.info('testText_static_0500 END');
      done();
    });

    
    /**
     * @tc.number   testText_static_0600
     * @tc.name     testText_static_0600
     * @tc.desc     testText_static_0600
     * @tc.level    Level.LEVEL2
     */
    it('testText_static_0600', Level.LEVEL2, async (done: () => void) => {
      console.info('testText_static_0600 START');
      let strJson = inspector.getInspectorByKey('text');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testText_static_0600 component strJson:" + strJson);

      expect(obj.getElement('$attrs').getString('textAlign')).assertEqual('TextAlign.Start');
      console.info('testText_static_0600 END');
      done();
    });

    
    /**
     * @tc.number   testText_static_0700
     * @tc.name     testText_static_0700
     * @tc.desc     testText_static_0700
     * @tc.level    Level.LEVEL2
     */
    it('testText_static_0700', Level.LEVEL2, async (done: () => void) => {
      console.info('testText_static_0700 START');
      try {
        const message: MessageManagerBase<TextAlign> = AppStorage.get<MessageManagerBase<TextAlign>>("messageManagerTextAlign")!
        message.notify({name:'textAlign',value:TextAlign.Center});
      } catch (err) {
        console.log("testText_static_0700 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew = inspector.getInspectorByKey('text');
      console.info("testText_static_0700 component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('textAlign'))
        .assertEqual('TextAlign.Center');
      console.info('testText_static_0700 END');
      done();
    });

    
    /**
     * @tc.number   testText_static_0800
     * @tc.name     testText_static_0800
     * @tc.desc     testText_static_0800
     * @tc.level    Level.LEVEL2
     */
    it('testText_static_0800', Level.LEVEL2, async (done: () => void) => {
      console.info('testText_static_0800 START');
      let strJson = inspector.getInspectorByKey('text');
      console.info("testText_static_0800 component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("testText_static_0800 component JSON.parseJsonElement(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getString('textOverflow')).assertEqual('TextOverflow.Clip');
      console.info('testText_static_0800 END');
      done();
    });

    
    /**
     * @tc.number   testText_static_0900
     * @tc.name     testText_static_0900
     * @tc.desc     testText_static_0900
     * @tc.level    Level.LEVEL2
     */
    it('testText_static_0900', Level.LEVEL2, async (done: () => void) => {
      console.info('testText_static_0900 START');
      try {
        let message: MessageManagerBase<TextOverflow> = AppStorage.get<MessageManagerBase<TextOverflow>>("messageManagerTextOverflow")!
        message.notify({name:'textOverflow',value:TextOverflow.None});
      } catch (err) {
        console.log("testText_static_0900 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJsonNew = inspector.getInspectorByKey('text');
      console.info("testText_static_0900 component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.stringify(JSON.parseJsonElement(strJsonNew)));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('textOverflow'))
        .assertEqual('TextOverflow.None');
      console.info('testText_static_0900 END');
      done();
    });

    
    /**
     * @tc.number   testText_static_1000
     * @tc.name     testText_static_1000
     * @tc.desc     testText_static_1000
     * @tc.level    Level.LEVEL2
     */
    it('testText_static_1000', Level.LEVEL2, async (done: () => void) => {
      console.info('testText_static_1000 START');
      let strJson = inspector.getInspectorByKey('text');
      console.info("testText_static_1000 component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("testText_static_1000 component JSON.parseJsonElement(strJson) is: " + JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getString('decoration'));
      expect(obj.getElement('$attrs').getString('decoration'))
        .assertEqual("{\"type\":\"TextDecorationType.None\",\"color\":\"#FFFF0000\"," +
          "\"style\":\"TextDecorationStyle.SOLID\"}");
      console.info('testText_static_1000 END');
      done();
    });

    
    /**
     * @tc.number   testText_static_1200
     * @tc.name     testText_static_1200
     * @tc.desc     testText_static_1200
     * @tc.level    Level.LEVEL2
     */
    it('testText_static_1200', Level.LEVEL2, async (done: () => void) => {
      console.info('testText_static_1200 START');
      try {
        const message: MessageManagerBase<string> = AppStorage.get<MessageManagerBase<string>>("messageManagerString")!
        message.notify({name:'fontColor',value:"#FFBC0229"});
      } catch (err) {
        console.log("testText_static_1200 change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('text');

      console.info("testText_static_1200 component JSON.parseJsonElement(strJsonNew) is: " +
      JSON.parseJsonElement(strJsonNew)
        .getElement('$attrs')
        .getString('fontColor'));
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontColor')).assertEqual('#FFBC0229');
      console.info('testText_static_1200 END');
      done();
    });

    // /*
    //  * @tc.number   testText_static_1300
    //  * @tc.name     testText_static_1300
    //  * @tc.desc     testText_static_1300
    //  * @tc.level    Level.LEVEL2
    //  */
    // it('testText_static_1300', Level.LEVEL2, async (done: () => void) => {  // 异常参数
    //   console.info('testText_static_1300 START');
    //   try {
    //     let eventData: emitter.EventData = {
    //       data: {
    //         "fontSize": "-a",
    //       }
    //     } as emitter.EventData
    //     let indexEvent: emitter.InnerEvent = {
    //       eventId: 232,
    //       priority: emitter.EventPriority.LOW
    //     }
    //     console.info("testText_static_1300 start to publish emit");
    //     emitter.emit(indexEvent, eventData);
    //   } catch (err) {
    //     console.log("testText_static_1300 change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(3000);
    //   let strJsonNew = inspector.getInspectorByKey('text');
    //
    //   console.info("testText_static_1300 component JSON.parseJsonElement(strJsonNew) is: " +
    //   JSON.parseJsonElement(strJsonNew)
    //     .getElement('$attrs')
    //     .getString('fontSize'));
    //   //line 79:resourceSize 暂未拿到
    //   expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontSize'))
    //     .assertEqual(uiContext.px2fp(resourceSize) + '.00fp');
    //   console.info('testText_static_1300 END');
    //   done();
    // });

    // /*
    //  * @tc.number   testText_static_1400
    //  * @tc.name     testText_static_1400
    //  * @tc.desc     testText_static_1400
    //  * @tc.level    Level.LEVEL2
    //  */
    // it('testText_static_1400', Level.LEVEL2, async (done: () => void) => { // 异常参数
    //   console.info('testText_static_1400 START');
    //   try {
    //     let eventData: emitter.EventData = {
    //       data: {
    //         "fontSize": "-20",
    //       }
    //     } as emitter.EventData
    //     let indexEvent: emitter.InnerEvent = {
    //       eventId: 233,
    //       priority: emitter.EventPriority.LOW
    //     }
    //     console.info("testText_static_1400 start to publish emit");
    //     emitter.emit(indexEvent, eventData);
    //   } catch (err) {
    //     console.log("testText_static_1400 change component data error: " + err.message);
    //   }
    //   await CommonFunc.sleep(2000);
    //   let strJsonNew = inspector.getInspectorByKey('text');
    //
    //   console.info("testText_static_1400 component JSON.parseJsonElement(strJsonNew) is: " +
    //   JSON.stringify(JSON.parseJsonElement(strJsonNew)
    //     .getElement('$attrs')
    //     .getString('fontSize')));
    //
    //   expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('fontSize'))
    //     .assertEqual(uiContext.px2fp(resourceSize) + '.00fp');//line 79 的 resourceSize未获取
    //   console.info('testText_static_1400 END');
    //   done();
    // });
  })
}