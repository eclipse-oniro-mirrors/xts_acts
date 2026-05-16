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
        dirPropRtl : null,
        dirPropAuto : null,
        dirPropLtr : null,
        dirPropNone : null,
    },

    onShow(){
        this.getCommonPropValues();
        globalThis.value = {
            dirPropRtl : this.dirPropRtl,
            dirPropAuto : this.dirPropAuto,
            dirPropLtr : this.dirPropLtr,
            dirPropNone : this.dirPropNone,
        }
    },

    getCommonPropValues(){
        this.dirPropRtl = this.$element("dirPropRtl").getInspector()
        this.dirPropAuto = this.$element("dirPropAuto").getInspector()
        this.dirPropLtr = this.$element("dirPropLtr").getInspector()
        this.dirPropNone = this.$element("dirPropNone").getInspector()
    }
}
