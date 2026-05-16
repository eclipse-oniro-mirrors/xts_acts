/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from "@ohos/hypium"
import router from '@ohos.router';
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function showDialogTest() {
  describe('showDialogTest', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/showDialogTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get showDialogTest state success ' + JSON.stringify(pages));
        if (!('showDialogTest' == pages.name)) {
          console.info('get showDialogTest state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push showDialogTest page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push showDialogTest page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   showDialogTest_0100
     * @tc.number SUB_ACE_showDialogTest_0100
     * @tc.desc   To test default  showDialog backgroundBlurStyle  BlurStyle.Thin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      console.info('[showDialogTest_0100] backgroundBlurStyle'+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_0100] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thin')
      }

      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0100 END');
      done();
    });

    /**
     * @tc.name   showDialogTest_0200
     * @tc.number SUB_ACE_showDialogTest_0200
     * @tc.desc   To test  showDialog backgroundBlurStyle  BlurStyle.Regular
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundColor:string = column.backgroundColor
     
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value

      console.info('[showDialogTest_0200] backgroundBlurStyle'+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_0200] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Regular')
      }
      
      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0200 END');
      done();
    });
    
    /**
     * @tc.name   showDialogTest_0300
     * @tc.number SUB_ACE_showDialogTest_0300
     * @tc.desc   To test  showDialogTest BlurStyle.BACKGROUND_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_0300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundColor:string = column.backgroundColor
     
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value

      console.info('[showDialogTest_0300] backgroundBlurStyle'+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_0300] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THIN')
      }


      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0300 END');
      done();
    });

    /**
     * @tc.name   showDialogTest_0400
     * @tc.number SUB_ACE_showDialogTest_0400
     * @tc.desc   To test  showDialogTest BlurStyle.Thick
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_0400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundColor:string = column.backgroundColor
    
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[showDialogTest_0400] shadow'+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_0400] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thick')
      }

      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0400 END');
      done();
    });

    
    /**
     * @tc.name   showDialogTest_0500
     * @tc.number SUB_ACE_showDialogTest_0500
     * @tc.desc   To test  showDialogTest shadow backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_0500', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      console.info('[showDialogTest_0500] backgroundBlurStyle '+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_0500] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_REGULAR')
      }

      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0500 END');
      done();
    });

    /**
     * @tc.name   showDialogTest_0600
     * @tc.number SUB_ACE_showDialogTest_0600
     * @tc.desc   To test  showDialogTest backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_0600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[showDialogTest_0600] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_0600] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THICK')
      }

      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0600 END');
      done();
    });


    /**
     * @tc.name   showDialogTest_0700
     * @tc.number SUB_ACE_showDialogTest_0700
     * @tc.desc   To test  showDialogTest backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_0700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[showDialogTest_0700] backgroundBlurStyle '+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_0700] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK')
      }
      

      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0700 END');
      done();
    });
    /**
     * @tc.name   showDialogTest_0800
     * @tc.number SUB_ACE_showDialogTest_0800
     * @tc.desc   To test  showDialogTest backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_0800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click7'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      console.info('[showDialogTest_0800] backgroundBlurStyle '+ backgroundBlurStyle)
      expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE')
      
      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0800 END');
      done();
    });

    /**
     * @tc.name   showDialogTest_0900
     * @tc.number SUB_ACE_showDialogTest_0900
     * @tc.desc   To test  showDialogTest backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_0900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click8'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[showDialogTest_0900] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_0900] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN')
      }

      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0900 END');
      done();
    });

    /**
     * @tc.name   showDialogTest_1000
     * @tc.number SUB_ACE_showDialogTest_1000
     * @tc.desc   To test  showDialogTest backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_1000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click9'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[showDialogTest_1000] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_1000] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THIN')
      }

      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_1000 END');
      done();
    });
    /**
     * @tc.name   showDialogTest_1100
     * @tc.number SUB_ACE_showDialogTest_1100
     * @tc.desc   To test  showDialogTest backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_1100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click10'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[showDialogTest_1100] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_1100] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_REGULAR')
      }

      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_1100 END');
      done();
    });

    /**
     * @tc.name   showDialogTest_1200
     * @tc.number SUB_ACE_showDialogTest_1200
     * @tc.desc   To test  showDialogTest backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_1200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_1200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click11'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[showDialogTest_1200] backgroundBlurStyle '+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_1200] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THICK')
      }

      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_1200 END');
      done();
    });

    /**
     * @tc.name   showDialogTest_1300
     * @tc.number SUB_ACE_showDialogTest_1300
     * @tc.desc   To test  showDialogTest backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_1300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_1300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click12'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[showDialogTest_1300] backgroundBlurStyle '+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_1200] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK')
      }

      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_1300 END');
      done();
    });
    /**
     * @tc.name   showDialogTest_1400
     * @tc.number SUB_ACE_showDialogTest_1400
     * @tc.desc   To test  showDialogTest backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showDialogTest_1400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('showDialogTest_1400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click13'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[showDialogTest_1400] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender; 
      console.info('[DialogOptions_1200] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK')
      }

      let button1 = await driver.findComponent(ON.text('button1'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_1400 END');
      done();
    });
  })
}