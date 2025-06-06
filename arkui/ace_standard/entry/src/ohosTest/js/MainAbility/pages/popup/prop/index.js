/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
        idProp : null,
        classProp : null,
        classPropNone : null,
        styleProp : null,
        refProp : null,
        refPropNone : null,
        disabledPropTrue : null,
        disabledPropFalse : null,
        disabledPropNone : null,
        dataProp : null,
        dataPropNone : null,
        clickEffectPropSmall : null,
        clickEffectPropMedium : null,
        clickEffectPropLarge : null,
        clickEffectPropNone : null,
        dirPropRtl : null,
        dirPropAuto : null,
        dirPropLtr : null,
        dirPropNone : null,
        forPropNull : null,
        forPropOne : null,
        forPropThree : null,
        ifPropTrue : null,
        showPropTrue : null,
        showPropFalse : null,
        showPropNone : null,

        targetProp : null,
        placementPropLeft : null,
        placementPropRight : null,
        placementPropTop : null,
        keepAlivePropTrue : null,
        keepAlivePropFalse : null,
        clickablePropTrue : null,
        clickablePropFalse : null,
        arrowOffsetProp : null,
    },

    onShow(){
        this.getCommonPropValues();
        globalThis.value = {
            idProp : this.idProp,
            classProp : this.classProp,
            classPropNone : this.classPropNone,
            styleProp : this.styleProp,
            refProp : this.refProp,
            refPropNone : this.refPropNone,
            disabledPropTrue : this.disabledPropTrue,
            disabledPropFalse : this.disabledPropFalse,
            disabledPropNone : this.disabledPropNone,
            dataProp : this.dataProp,
            dataPropNone : this.dataPropNone,
            clickEffectPropSmall : this.clickEffectPropSmall,
            clickEffectPropMedium : this.clickEffectPropMedium,
            clickEffectPropLarge : this.clickEffectPropLarge,
            clickEffectPropNone : this.clickEffectPropNone,
            dirPropRtl : this.dirPropRtl,
            dirPropAuto : this.dirPropAuto,
            dirPropLtr : this.dirPropLtr,
            dirPropNone : this.dirPropNone,
            forPropNull : this.forPropNull,
            forPropOne : this.forPropOne,
            forPropThree : this.forPropThree,
            ifPropTrue : this.ifPropTrue,
            showPropTrue : this.showPropTrue,
            showPropFalse : this.showPropFalse,
            showPropNone : this.showPropNone,

            targetProp : this.targetProp,
            placementPropLeft : this.placementPropLeft,
            placementPropRight : this.placementPropRight,
            placementPropTop :this.placementPropTop,
            keepAlivePropTrue: this.keepAlivePropTrue,
            keepAlivePropFalse: this.keepAlivePropFalse,
            clickablePropTrue : this.clickablePropTrue,
            clickablePropFalse : this.clickablePropFalse,
            arrowOffsetProp : this.arrowOffsetProp
        }
    },

    getCommonPropValues(){
        this.idProp = this.$element("idProp").getInspector()
        this.classProp = this.$element("classProp").getInspector()
        this.classPropNone = this.$element("classPropNone").getInspector()
        this.styleProp = this.$element("styleProp").getInspector()
        this.refProp = this.$element("refProp").getInspector()
        this.refPropNone = this.$element("refPropNone").getInspector()
        this.disabledPropTrue = this.$element("disabledPropTrue").getInspector()
        this.disabledPropFalse = this.$element("disabledPropFalse").getInspector()
        this.disabledPropNone = this.$element("disabledPropNone").getInspector()
        this.dataProp = this.$element("dataProp").getInspector()
        this.dataPropNone = this.$element("dataPropNone").getInspector()
        this.clickEffectPropSmall = this.$element("clickEffectPropSmall").getInspector()
        this.clickEffectPropMedium = this.$element("clickEffectPropMedium").getInspector()
        this.clickEffectPropLarge = this.$element("clickEffectPropLarge").getInspector()
        this.clickEffectPropNone = this.$element("clickEffectPropNone").getInspector()
        this.dirPropRtl = this.$element("dirPropRtl").getInspector()
        this.dirPropAuto = this.$element("dirPropAuto").getInspector()
        this.dirPropLtr = this.$element("dirPropLtr").getInspector()
        this.dirPropNone = this.$element("dirPropNone").getInspector()
        this.forPropNull = this.$element("forPropNull").getInspector()
        this.forPropOne = this.$element("forPropOne").getInspector()
        this.forPropThree = this.$element("forPropThree").getInspector()
        this.ifPropTrue = this.$element("ifPropTrue").getInspector()
        this.showPropTrue = this.$element("showPropTrue").getInspector()
        this.showPropFalse = this.$element("showPropFalse").getInspector()
        this.showPropNone = this.$element("showPropNone").getInspector()

        this.targetProp = this.$element("targetProp").getInspector()
        this.placementPropLeft = this.$element("placementPropLeft").getInspector()
        this.placementPropRight = this.$element("placementPropRight").getInspector()
        this.placementPropTop = this.$element("placementPropTop").getInspector()
        this.keepAlivePropTrue = this.$element("keepAlivePropTrue").getInspector()
        this.keepAlivePropFalse = this.$element("keepAlivePropFalse").getInspector()
        this.clickablePropTrue = this.$element("clickablePropTrue").getInspector()
        this.clickablePropFalse = this.$element("clickablePropFalse").getInspector()
        this.arrowOffsetProp = this.$element("arrowOffsetProp").getInspector()
    },
}
