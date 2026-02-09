/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundle from '@ohos.bundle';
import uitest from '@ohos.UiTest';
const sleep = async function sleep (time){
     if (!time){
       times = 10;
     }
     await new Promise((res) => setTimeout(res,times));
   };

const getPermission = async function (name,context){
     if (!name){
         name = 'ohos.acts.multimedia.mediaLibrary'; 
       }
       console.info('gegetPermissionstart',name);
     let permissions = ['ohos.permission.MEDIA_LOCATION','ohos.permission.READ_MEDIA','ohos.permission.WRITE_MEDIA'];
     let atManager = abilityAccessCtrl.createAtManager();
     try{
          atManager.requestPermissionsFromUser(context,permissions,(err,data) =>{
            console.info('getPermissionrequestPermissionsFromUser${JSON.stringify(data)}');
          });
     } catch (err){
      console.log('get permissioncatch err -> ${JSON.stringify(err)}');
     }  
     await sleep(1000);
     let driver = uitest.Driver.creat();
     await sleep(2000);
     let button = awaitdriver.findComponent(uiest.ON.text('允许'));
     await button.click();
     await sleep (2000);
     let appinfo = awaitbundle.getApplicationinfo(name,0,100);
     let tokenID = appinfo.accessTokenID;
     let isGranted1 = awaitatManager.verifyAccessToken(tokenID,'ohos.permission.MEDIA_LOCATION');
     let isGranted2 = awaitatManager.verifyAccessToken(tokenID,'ohos.permission.READ_MEDIA');
     let isGranted3 = awaitatManager.verifyAccessToken(tokenID,'ohos.permission.WRITE_MEDIA');
        if (!(isGranted1 === 0 && isGranted2 === 0 && isGranted3 === 0)){
              console.info('getPermissionfailed');
        }
              console.info('getPermissionend');
};
export{getPermission,sleep};