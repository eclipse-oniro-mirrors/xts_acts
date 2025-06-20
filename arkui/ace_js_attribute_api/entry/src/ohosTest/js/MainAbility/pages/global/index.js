/**
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

export default {
    data:{
        title: "",
        res:""
    },
    onInit() {
        this.title = "click";
        this.res = "btnClick"
    },
    clickBtn(){
        if(typeof getApp !== 'undefined'){
            let appData = getApp().data;
            console.log('-----getApp---------'+JSON.stringify(appData))
            if(typeof appData !== 'undefined'){
                this.title = appData.test
            }
        }
    },
    clickParticle(){
        try {
            createLocalParticleAbility('com.freesonwill.facallpa.biz.MyLocalParticleAbility');
        }catch (error){
            this.res = error
            console.log('errorerrorerror'+error)
        }
    }
}



