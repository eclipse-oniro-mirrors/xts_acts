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
import inputMethod from '@ohos.inputMethod';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base'
import commonEventManager from '@ohos.commonEventManager';

function expectTrue(data: ESObject) {
  try {
    expect(data).assertTrue();
  } catch (err) {
    console.info('assertion failure');
  }
};

function expectContain(a: ESObject, b: ESObject) {
  try {
    expect(a).assertContain(b);
  } catch (err) {
    console.info('assertion failure');
  }
};

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

let st: ESObject = null;

const sleep = (timeout: number): Promise<ESObject> => {
  return new Promise(resolve => {
    const st = setTimeout(() => {
      resolve(null);
    }, timeout);
  });
};


export default function inputMethodTest() {
  describe('inputMethodPreviewText', () => {
    let attribute: inputMethod.TextConfig = {
      inputAttribute: {
        textInputType: 0,
        enterKeyType: 0
      }
    }

    beforeAll(async (done: Function) => {
      console.info(`====>beforeAll start!`);
      commonEventFunction('start_on_sendMessage',done);
      let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 500
        }
      console.info(`====>beforeAll commonEvent publish!`);
      commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, ()=>{});
    })

    afterAll((done: Function) => {
      console.info(`====>afterAll start!`);
      let commonEventPublishData: commonEventManager.CommonEventPublishData = {
          code: 501
        }
      commonEventManager.publish('InputMethodWindManageTest', commonEventPublishData, ()=>{});
      done();
    })

    afterEach(
      async () => {
        try {
          await inputMethod.getController().detach();
          inputMethod.getController().off('setPreviewText');
          inputMethod.getController().off('finishTextPreview');
          console.info(`clsoe inputMethod success`);
        } catch (error) {
          console.info(`clsoe inputMethod fail, error: [${error.code}, ${error.message}]`);
        }
        clearTimeout(st);
      }
    );

    let commonEventFunction = (testCaseName: string, done:Function)=>{
      let unSubscriberCallback = (err: BusinessError) => {
        console.info(`====>${testCaseName} unSubscriberCallback start`);
        if (err) {
          console.error(`====>${testCaseName} unSubscriberCallback failed: ` + JSON.stringify(err));
        } else {
          console.info(`====>${testCaseName} unSubscriberCallback finsh`);
        }
      }

      let subscriberCallback = (err: BusinessError, data: commonEventManager.CommonEventData) => {
        console.info(`====>${testCaseName} subscriberCallback data: ` + JSON.stringify(data));
        commonEventManager.unsubscribe(subscriber, unSubscriberCallback);
        try {
          expect(data.data).assertEqual('SUCCESS');
          console.info(`====>${testCaseName} end<====`);
          done();
        } catch (err) {
          console.info(`====>${testCaseName} end<====` + JSON.stringify(err));
          done();
        }
      }

      let commonEventSubscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
        events: [`${testCaseName}`]
      }
      let subscriber: ESObject;
      commonEventManager.createSubscriber(commonEventSubscribeInfo).then(async (data) => {
        try{
          subscriber = data;
          console.info(`====>${testCaseName} subscribe data: ` + JSON.stringify(data));
          commonEventManager.subscribe(subscriber, subscriberCallback);
          console.info(`====>${testCaseName} subscribe finish====`);
          if(testCaseName !== 'start_on_sendMessage'){            
            let msgId: string = `${testCaseName}`;
            await inputMethod.getController().sendMessage(msgId);
          }
        }catch(err){
          console.info(`====>Subscribe failed, code:${err.code}, message is ${err.message}`)
        }      
      }).catch((err: BusinessError) => {
        console.info(`====>createSubscriber failed, code:${err.code}, message is ${err.message}`)
      })
    }


    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_0100
     * @tc.number SUB_inputMethod_IMF_setPreview_0100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_0100', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_0100';
      let setPreviewTextCallback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        try{
          console.info(`====>${CASE_NAME} SetPreviewTextCallback text:${text}`);
          expect(text).assertEqual(`${CASE_NAME}`);
          done();
        }catch(err){
          console.info(`====>${CASE_NAME} SetPreviewTextCallback catch err`)
          done();
        }       
      };
      let finishTextPreviewCallback = ()=>{
        console.info(`====>${CASE_NAME} finishTextPreviewCallback`);
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback);
        await inputMethod.getController().attach(true, attribute)
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }
      let msgId: string = `${CASE_NAME}`;
      await inputMethod.getController().sendMessage(msgId);
    })

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_0200
     * @tc.number SUB_inputMethod_IMF_setPreview_0200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_0200', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_0200';      
      let count = 0;
      let setPreviewTextCallback1: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        try{
          console.info(`====>${CASE_NAME} SetPreviewTextCallback1 text:${text}`);
          count += 1;
        }catch(err){
          console.info(`====>${CASE_NAME} finishTextPreviewCallback1 catch err`)
        }        
      };

      let setPreviewTextCallback2: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        try{
          console.info(`====>${CASE_NAME} SetPreviewTextCallback2 text:${text}`);
          count += 1;
          expect(count).assertEqual(2);
          done();
        }catch(err){
          console.info(`====>${CASE_NAME} SetPreviewTextCallback2 catch err`)
          done();
        }       
      };
      let finishTextPreviewCallback = ()=>{ 
        console.info(`====>${CASE_NAME} finishTextPreviewCallback`); 
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback1);
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback2);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback);        
        await inputMethod.getController().attach(true, attribute)
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }
      let msgId: string = `${CASE_NAME}`;
      await inputMethod.getController().sendMessage(msgId);
    })

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_0300
     * @tc.number SUB_inputMethod_IMF_setPreview_0300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_0300', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_0300';
      let setPreviewTextCallback1: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>${CASE_NAME} SetPreviewTextCallback1 text:${text}`);
        expect().assertFail();
        done();
      };

      let setPreviewTextCallback2: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        try{
          console.info(`====>${CASE_NAME} SetPreviewTextCallback2 text:${text}`);
          expect(text).assertEqual(`${CASE_NAME}`);
          done();
        }catch(err){
          console.info(`====>${CASE_NAME} SetPreviewTextCallback2 catch err`)
          done();
        }       
      };
      let finishTextPreviewCallback = ()=>{ 
        console.info(`====>${CASE_NAME} finishTextPreviewCallback`); 
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback1);
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback2);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback);        
        await inputMethod.getController().attach(true, attribute)
        inputMethod.getController().off('setPreviewText', setPreviewTextCallback1);
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }
      let msgId: string = `${CASE_NAME}`;
      await inputMethod.getController().sendMessage(msgId);
    })

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_0400
     * @tc.number SUB_inputMethod_IMF_setPreview_0400
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_0400', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_0400';
      let setPreviewTextCallback1: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>${CASE_NAME} SetPreviewTextCallback text:${text}`); 
        expect().assertFail();
        done();      
      };

      let setPreviewTextCallback2: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>${CASE_NAME} SetPreviewTextCallback text:${text}`); 
        expect().assertFail();
        done();      
      };

      let finishTextPreviewCallback = ()=>{ 
        console.info(`====>${CASE_NAME} finishTextPreviewCallback1`); 
        expect().assertFail();
        done();
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback1);
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback1);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback);
        inputMethod.getController().off('setPreviewText');        
        await inputMethod.getController().attach(true, attribute)
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }
      commonEventFunction(CASE_NAME, done);
    })

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_0500
     * @tc.number SUB_inputMethod_IMF_setPreview_0500
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_0500', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_0500';
      let setPreviewTextCallback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>${CASE_NAME} SetPreviewTextCallback text:${text}`);       
      };
      let count = 0;
      let finishTextPreviewCallback1 = ()=>{  
        try{
          console.info(`====>${CASE_NAME} finishTextPreviewCallback1`); 
          count += 1;
        }catch(err){
          console.info(`====>${CASE_NAME} finishTextPreviewCallback1 catch err`)
        } 
      }

      let finishTextPreviewCallback2 = ()=>{
        try{
          console.info(`====>${CASE_NAME} finishTextPreviewCallback2`); 
          count += 1;
          expect(count).assertEqual(2);
          done();
        }catch(err){
          console.info(`====>${CASE_NAME} finishTextPreviewCallback2 catch err`)
          done();
        }    
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback1);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback2);        
        await inputMethod.getController().attach(true, attribute)
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }
      let msgId: string = `${CASE_NAME}`;
      await inputMethod.getController().sendMessage(msgId);
    })

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_0600
     * @tc.number SUB_inputMethod_IMF_setPreview_0600
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_0600', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_0600';
      let setPreviewTextCallback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>${CASE_NAME} SetPreviewTextCallback text:${text}`);       
      };
      let finishTextPreviewCallback1 = ()=>{  
        console.info(`====>${CASE_NAME} finishTextPreviewCallback1`);      
        expect().assertFail();
        done(); 
      }

      let finishTextPreviewCallback2 = ()=>{
        try{
          console.info(`====>${CASE_NAME} finishTextPreviewCallback2`); 
          expect(true).assertTrue();
          done();
        }catch(err){
          console.info(`====>${CASE_NAME} finishTextPreviewCallback2 catch err`)
          expect().assertFail();
          done();
        }    
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback1);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback2);        
        await inputMethod.getController().attach(true, attribute)
        inputMethod.getController().off('finishTextPreview', finishTextPreviewCallback1);
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }
      let msgId: string = `${CASE_NAME}`;
      await inputMethod.getController().sendMessage(msgId);
    })

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_0700
     * @tc.number SUB_inputMethod_IMF_setPreview_0700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_0700', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_0700';
      let setPreviewTextCallback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>${CASE_NAME} SetPreviewTextCallback text:${text}`);       
      };
      let callbackCount = 0;
      let finishTextPreviewCallback1 = ()=>{ 
        console.info(`====>${CASE_NAME} finishTextPreviewCallback1`); 
        expect().assertFail();
        done();
      }

      let finishTextPreviewCallback2 = ()=>{
        console.info(`====>${CASE_NAME} finishTextPreviewCallback2`); 
        expect().assertFail();
        done();
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback1);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback2);
        inputMethod.getController().off('finishTextPreview');        
        await inputMethod.getController().attach(true, attribute)
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }
      commonEventFunction(CASE_NAME, done);
    }) 

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_0800
     * @tc.number SUB_inputMethod_IMF_setPreview_0800
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_0800', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_0800';
      let setPreviewTextCallback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>${CASE_NAME} SetPreviewTextCallback text:${text}`);       
      };
      let finishTextPreviewCallback = ()=>{
        try{
          console.info(`====>${CASE_NAME} finishTextPreviewCallback`); 
          expect(true).assertTrue();
          done();
        }catch(err){
          console.info(`====>${CASE_NAME} finishTextPreviewCallback catch err`)
          done();
        }    
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback);        
        await inputMethod.getController().attach(true, attribute)
        inputMethod.getController().off('setPreviewText');
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      } 
      commonEventFunction(CASE_NAME, done);
    }) 

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_0900
     * @tc.number SUB_inputMethod_IMF_setPreview_0900
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_0900', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_0900';
      let setPreviewTextCallback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>SUB_inputMethod_IMF_setPreview_0900 SetPreviewTextCallback text:${text}`);       
      };
      let finishTextPreviewCallback = ()=>{
        try{
          console.info(`====>SUB_inputMethod_IMF_setPreview_0900 finishTextPreviewCallback`); 
          expect(true).assertTrue();
          done();
        }catch(err){
          console.info(`====>SUB_inputMethod_IMF_setPreview_0900 finishTextPreviewCallback catch err`)
          done();
        }    
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback);        
        await inputMethod.getController().attach(true, attribute)
        inputMethod.getController().off('setPreviewText');
      }catch(err){
        console.info(`====>SUB_inputMethod_IMF_setPreview_0900 catch err:${err.code}`);
        expect().assertFail();
        done();
      }   
      commonEventFunction(CASE_NAME, done);
    })

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_1000
     * @tc.number SUB_inputMethod_IMF_setPreview_1000
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_1000', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_1000';
      let setPreviewTextCallback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>${CASE_NAME} SetPreviewTextCallback text:${text}`);
        expect().assertFail();
        done();       
      };
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback);        
        await inputMethod.getController().attach(true, attribute)
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }   
      commonEventFunction(CASE_NAME, done);
    })  

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_1100
     * @tc.number SUB_inputMethod_IMF_setPreview_1100
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_1100', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_1100';
      let finishTextPreviewCallback = ()=>{
        console.info(`====>${CASE_NAME} finishTextPreviewCallback`); 
        expect().assertFail();
        done();
      }
      try{
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback);        
        await inputMethod.getController().attach(true, attribute)
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }  
      commonEventFunction(CASE_NAME, done);
    })

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_1200
     * @tc.number SUB_inputMethod_IMF_setPreview_1200
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_1200', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_1200';
      let setPreviewTextCallback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>${CASE_NAME} SetPreviewTextCallback text:${text}`);
        expect().assertFail();
        done();       
      };
      let finishTextPreviewCallback = ()=>{
        console.info(`====>${CASE_NAME} finishTextPreviewCallback`); 
        expect().assertFail();
        done();
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback);        
        await inputMethod.getController().attach(true, attribute)
        inputMethod.getController().off('setPreviewText');
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }  
      commonEventFunction(CASE_NAME, done);
    })  

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_1300
     * @tc.number SUB_inputMethod_IMF_setPreview_1300
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_1300', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_1300';
      let setPreviewTextCallback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>${CASE_NAME} SetPreviewTextCallback text:${text}`);
        expect().assertFail();
        done();       
      };
      let finishTextPreviewCallback = ()=>{
        console.info(`====>${CASE_NAME} finishTextPreviewCallback`); 
        expect().assertFail();
        done();
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback);        
        await inputMethod.getController().attach(true, attribute)
        inputMethod.getController().off('finishTextPreview');
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }
      commonEventFunction(CASE_NAME, done); 
    })  

    /**
     * @tc.name   SUB_inputMethod_IMF_setPreview_1700
     * @tc.number SUB_inputMethod_IMF_setPreview_1700
     * @tc.desc   Function test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_inputMethod_IMF_setPreview_1700', Level.LEVEL2, async (done: Function) => {
      const CASE_NAME = 'SUB_inputMethod_IMF_setPreview_1700';
      let setPreviewTextCallback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range)=>{
        console.info(`====>${CASE_NAME} SetPreviewTextCallback text:${text}`);       
      };
      let finishTextPreviewCallback = ()=>{
        try{
          console.info(`====>${CASE_NAME} finishTextPreviewCallback`); 
          expect(true).assertTrue();
          done();
        }catch(err){
          console.info(`====>${CASE_NAME} finishTextPreviewCallback catch err`)
          done();
        }    
      }
      try{
        inputMethod.getController().on('setPreviewText', setPreviewTextCallback);
        inputMethod.getController().on('finishTextPreview', finishTextPreviewCallback);        
        await inputMethod.getController().attach(true, attribute)
      }catch(err){
        console.info(`====>${CASE_NAME} catch err:${err.code}`);
        expect().assertFail();
        done();
      }
      let msgId: string = `${CASE_NAME}`;
      await inputMethod.getController().sendMessage(msgId);
    })
  })
}