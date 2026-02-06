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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level,Size,TestType } from '@ohos/hypium'
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

export default function DialogOptions() {
  describe('DialogOptions', () => {
    
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/DialogOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get DialogOptions state success ' + JSON.stringify(pages));
        if (!('DialogOptions' == pages.name)) {
          console.info('get DialogOptions state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push DialogOptions page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push DialogOptions page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   DialogOptions_0100
     * @tc.number SUB_ACE_DialogOptions_0100
     * @tc.desc   To test default  DialogOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_0100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click1'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundColor:string = column.backgroundColor
     
      let borderStyle:string = column.borderStyle
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      console.info('[DialogOptions_0100] column $attrs'+ JSON.stringify(column))
      
      console.info('[DialogOptions_0100] borderStyle'+ borderStyle)
      expect(borderStyle).assertEqual('BorderStyle.Solid')
      console.info('[DialogOptions_0100] backgroundBlurStyle'+ backgroundBlurStyle)
      
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      console.info('[DialogOptions_0100] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
    
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thin');
      }

      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_0100 END');
      done();
    });

    /**
     * @tc.name   DialogOptions_0200
     * @tc.number SUB_ACE_DialogOptions_0200
     * @tc.desc   To test  DialogOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_0200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click2'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundColor:string = column.backgroundColor
      let topLeft:string = column.borderRadius.topLeft
      let topRight:string = column.borderRadius.topRight
      let bottomLeft:string = column.borderRadius.bottomLeft
      let borderWidth:string = column.borderWidth
      let borderColor:string = column.borderColor
      let borderStyle:string = column.borderStyle
      let width:string = column.size?.width
      let height:string = column.size?.height
      let shadow:string = column.shadow
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      console.info('[DialogOptions_0200] backgroundColor'+ backgroundColor)
      expect(column.backgroundColor).assertEqual('#FF6582F8')

      console.info('[DialogOptions_0200] topLeft'+ topLeft)
      expect(topLeft).assertEqual('20.00vp')

      console.info('[DialogOptions_0200] topRight'+ topRight)
      expect(topRight).assertEqual('20.00px')

      console.info('[DialogOptions_0200] bottomLeft'+ bottomLeft)
      expect(bottomLeft).assertEqual('0.00vp')


      console.info('[DialogOptions_0200] borderWidth'+ borderWidth)
      expect(borderWidth).assertEqual('1.00vp')

      console.info('[DialogOptions_0200] borderColor'+ borderColor)
      expect(borderColor).assertEqual('#FFFFC0CB')

      console.info('[DialogOptions_0200] borderStyle'+ borderStyle)
      expect(borderStyle).assertEqual('BorderStyle.Dotted')

      console.info('[DialogOptions_0200] width'+ width)
      expect(width).assertEqual('200.00vp')
      console.info('[DialogOptions_0200] height'+ height)
      expect(height).assertEqual('80.00vp')
      console.info('[DialogOptions_0200] shadow'+ shadow)
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultXS')
      console.info('[DialogOptions_0200] backgroundBlurStyle'+ backgroundBlurStyle)
      
      expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE')

      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_0200 END');
      done();
    });
    
    /**
     * @tc.name   DialogOptions_0300
     * @tc.number SUB_ACE_DialogOptions_0300
     * @tc.desc   To test  DialogOptions undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_0300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click3'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundColor:string = column.backgroundColor
     
      let borderStyle:string = column.borderStyle
      let width:string = column.size?.width
      let height:string = column.size?.height
      let shadow:string = column.shadow
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
           

      console.info('[DialogOptions_0300] borderStyle'+ borderStyle)
      expect(borderStyle).assertEqual('BorderStyle.Solid')

      console.info('[DialogOptions_0300] height'+ shadow)
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultSM')

      console.info('[DialogOptions_0300] height'+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      console.info('[DialogOptions_0300] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Regular');
      }
      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_0300 END');
      done();
    });

    /**
     * @tc.name   DialogOptions_0400
     * @tc.number SUB_ACE_DialogOptions_0400
     * @tc.desc   To test  DialogOptions null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_0400', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click4'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundColor:string = column.backgroundColor
     
      let borderStyle:string = column.borderStyle
      let width:string = column.size?.width
      let height:string = column.size?.height
      let shadow:string = column.shadow
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value

      console.info('[DialogOptions_0400] borderStyle'+ borderStyle)
      expect(borderStyle).assertEqual('BorderStyle.Solid')

      console.info('[DialogOptions_0400] shadow'+ shadow)
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingSM')
      console.info('[DialogOptions_0400] backgroundBlurStyle'+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      console.info('[DialogOptions_0400] uniRenderFlag'+ uniRenderFlag)
      
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thick');
      }

      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_0400 END');
      done();
    });

    
    /**
     * @tc.name   DialogOptions_0500
     * @tc.number SUB_ACE_DialogOptions_0500
     * @tc.desc   To test  DialogOptions shadow backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_0500', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click5'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let radius:string = column.shadow?.radius
      let type:string = column.shadow?.type
      let color:string = column.shadow?.color
      let offsetX:string = column.shadow?.offsetX
      let offsetY:string = column.shadow?.offsetY
      let fill:string = column.shadow?.fill
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[DialogOptions_0500] radius '+ radius)
      console.info('[DialogOptions_0500] type '+ type)
      console.info('[DialogOptions_0500] color '+ color)
      console.info('[DialogOptions_0500] offsetX '+ offsetX)
      console.info('[DialogOptions_0500] offsetY '+ offsetY)
      console.info('[DialogOptions_0500] fill '+ fill)
      console.info('[DialogOptions_0500] backgroundBlurStyle '+ backgroundBlurStyle)

      expect(radius).assertEqual('10.000000')
      expect(type).assertEqual('1')
      expect(color).assertEqual('#FF94A0F0')
      expect(offsetX).assertEqual('2.000000')
      expect(offsetY).assertEqual('3.000000')
      expect(fill).assertEqual('1')
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THIN');
      }


      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_0500 END');
      done();
    });

    /**
     * @tc.name   DialogOptions_0600
     * @tc.number SUB_ACE_DialogOptions_0600
     * @tc.desc   To test  DialogOptions backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_0600', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click6'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);
      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[DialogOptions_0600] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      }

      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_0600 END');
      done();
    });


    /**
     * @tc.name   DialogOptions_0700
     * @tc.number SUB_ACE_DialogOptions_0700
     * @tc.desc   To test  DialogOptions backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_0700', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_0700 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click7'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[DialogOptions_0700] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THICK');
      }

      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_0700 END');
      done();
    });
    /**
     * @tc.name   DialogOptions_0800
     * @tc.number SUB_ACE_DialogOptions_0800
     * @tc.desc   To test  DialogOptions backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_0800', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_0800 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click8'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[DialogOptions_0800] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK')
      }
      

      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_0800 END');
      done();
    });

    /**
     * @tc.name   DialogOptions_0900
     * @tc.number SUB_ACE_DialogOptions_0900
     * @tc.desc   To test  DialogOptions backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_0900', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_0900 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click9'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[DialogOptions_0900] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN')
      }

      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_0900 END');
      done();
    });

    /**
     * @tc.name   DialogOptions_1000
     * @tc.number SUB_ACE_DialogOptions_1000
     * @tc.desc   To test  DialogOptions backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_1000', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_1000 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click10'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[DialogOptions_1000] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THIN')
      }
      

      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_1000 END');
      done();
    });
    /**
     * @tc.name   DialogOptions_1100
     * @tc.number SUB_ACE_DialogOptions_1100
     * @tc.desc   To test  DialogOptions backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_1100', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_1100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click11'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[DialogOptions_1100] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_REGULAR')
      }
      

      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_1100 END');
      done();
    });

    /**
     * @tc.name   DialogOptions_1200
     * @tc.number SUB_ACE_DialogOptions_1200
     * @tc.desc   To test  DialogOptions backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_1200', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_1200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click12'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[DialogOptions_1200] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK')
      }
      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_1200 END');
      done();
    });

    /**
     * @tc.name   DialogOptions_1300
     * @tc.number SUB_ACE_DialogOptions_1300
     * @tc.desc   To test  DialogOptions backgroundBlurStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DialogOptions_1300', TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('DialogOptions_1300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click13'));
      await button.click();
      await CommonFunc.sleep(1000);
      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column: ESObject = obj.$children[1].$children[0].$attrs
      let backgroundBlurStyle:string =  column.backgroundBlurStyle?.value
      
      console.info('[DialogOptions_1300] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.$children[1].$attrs?.uniRender;
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THICK')
      }
      let button1 = await driver.findComponent(ON.text('确认'));
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_1300 END');
      done();
    });

  })
}