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

import { afterEach, beforeEach, describe, it } from '@ohos/hypium';
import Utils from './Utils';

export default function webInitTest() {

  describe('WebInitTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebInitTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebInitTest afterEach end");
      done();
    })

    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_016                                                                                                                                                          
     *tc.name SearchAllAsync                                                                                                                                                                                                               
     *tc.desic zoom the current page
     */
    it('SearchAllAsync', 0, async (done: Function) => {
      await Utils.emitEvent("emitSearchAllAsync", 10)
      Utils.registerEvent("SearchAllAsync", "01", 16, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_033                                                                                                                                                                  
     *tc.name ContextMenuMediaType                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('ContextMenuMediaType', 0, async (done: Function) => {
      await Utils.emitEvent("emitContextMenuMediaType", 10)
      Utils.registerEvent("ContextMenuMediaType", 1, 33, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_034                                                                                                                                                                 
     *tc.name ContextMenuInputFieldType                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('ContextMenuInputFieldType', 0, async (done: Function) => {
      await Utils.emitEvent("emitContextMenuInputFieldType", 10)
      Utils.registerEvent("ContextMenuInputFieldType", 1, 34, done);
      Utils.registerEvent("ContextMenuInputFieldType", 4, 35, done);
      Utils.registerEvent("ContextMenuInputFieldType", 5, 36, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
    /* 
     *tc.number SUB_ACE_BASIC_ETS_WEB_DEV_THREE_API_035                                                                                                                                                                 
     *tc.name ContextMenuEditStateFlags                                                                                                                                                                                                                
     *tc.desic Save current page
     */
    it('ContextMenuEditStateFlags', 0, async (done: Function) => {
      await Utils.emitEvent("emitContextMenuEditStateFlags", 10)
      Utils.registerEvent("ContextMenuEditStateFlags", 0, 37, done);
      Utils.registerEvent("ContextMenuEditStateFlags", 1, 38, done);
      Utils.registerEvent("ContextMenuEditStateFlags", 2, 39, done);
      Utils.registerEvent("ContextMenuEditStateFlags", 4, 40, done);
      Utils.registerEvent("ContextMenuEditStateFlags", 8, 41, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0800
     *tc.name testGetFavicon
     *tc.desc test for getFavicon
     */
    it('testGetFavicon',0,async (done: Function) =>{
      await Utils.emitEvent("emitGetFavicon", 10)  
      Utils.registerEvent("testGetFavicon",null,114,done);
      sendEventByKey('WebInitTestButton',10,'');
    })
    /*
     *tc.number SUB_ACE_BASIC_ETS_API_0900
     *tc.name testGetFaviconAgain
     *tc.desc test for getFavicon again
     */
    it('testGetFaviconAgain',0,async (done: Function) =>{
      await Utils.emitEvent("emitGetFaviconAgain", 10)
      Utils.registerEvent("testGetFaviconAgain",true,116,done);
      sendEventByKey('WebInitTestButton',10,'');
    })
    /*
    * @tc.number      : SUB_WEB_ONSEARCHRESULTRECEIVE_0100
    * @tc.name        : testOnSearchResultReceive001
    * @tc.desc        : test onSearchResultReceive when have results
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnSearchResultReceive001', 0, async (done: Function) => {
      await Utils.emitEvent("emitOnSearchResultReceive001", 10)
      Utils.registerEvent("testOnSearchResultReceive001", 3, 60414, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_ONSEARCHRESULTRECEIVE_0200
    * @tc.name        : testOnSearchResultReceive002
    * @tc.desc        : test onSearchResultReceive when have no results
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnSearchResultReceive002', 0, async (done: Function) => {
      await Utils.emitEvent("emitOnSearchResultReceive002", 10)
      Utils.registerEvent("testOnSearchResultReceive002", 0, 60416, done);
      sendEventByKey('WebInitTestButton', 10, '');
    })

    
  })
}
