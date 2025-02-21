/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
 
import prompt from '@system.prompt';

export default {
    data:{
        listOne:[{}],
        listThree:[{},{},{}],
        forPropNull : null,
        forPropOne : null,
        forPropThree : null,
        ifPropTrue : null,
        showPropTrue : null,
        showPropFalse : null,
        showPropNone : null,
    },

    onShow(){
        this.getCommonPropValues();
        globalThis.value = {
            forPropNull : this.forPropNull,
            forPropOne : this.forPropOne,
            forPropThree : this.forPropThree,
            ifPropTrue : this.ifPropTrue,
            showPropTrue : this.showPropTrue,
            showPropFalse : this.showPropFalse,
            showPropNone : this.showPropNone,
        }
    },

    getCommonPropValues(){

        this.forPropOne = this.$element("forPropOne").getInspector()


    }
}
