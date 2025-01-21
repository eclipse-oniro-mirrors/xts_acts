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
        focusablePropTrue : null,
        focusablePropFalse : null,
        dataProp : null,
        dataPropNone : null,
        forPropNull : null,
        forPropOne : null,
        forPropThree : null,
        ifPropTrue : null,
        ifPropFalse : null,
        ifPropNone : null,
        showPropTrue : null,
        showPropFalse : null,
        mutedPropFalse : null,
        mutedPropTrue : null,
        srcProp : null,
        srcPropNone : null,
        autoplayPropFalse : null,
        autoplayPropTrue : null,
        posterProp : null,
        posterPropNone : null,
        controlsPropFalse : null,
        controlsPropTrue : null,
        loopPropFalse : null,
        loopPropTrue : null,
        loopPropNone : null,
        starttimeProp : null,
        directionPropAuto : null,
        directionPropVertical : null,
        directionPropHorizontal : null,
        directionPropAdapt : null,
        directionPropNone : null,
        speedProp : null,
        speedPropNone : null,
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
            focusablePropTrue : this.focusablePropTrue,
            focusablePropFalse : this.focusablePropFalse,
            dataProp : this.dataProp,
            dataPropNone : this.dataPropNone,
            forPropNull : this.forPropNull,
            forPropOne : this.forPropOne,
            forPropThree : this.forPropThree,
            ifPropTrue : this.ifPropTrue,
            showPropTrue : this.showPropTrue,
            showPropFalse : this.showPropFalse,
            mutedPropFalse : this.mutedPropFalse,
            mutedPropTrue : this.mutedPropTrue,
            srcProp : this.srcProp,
            srcPropNone : this.srcPropNone,
            autoplayPropFalse : this.autoplayPropFalse,
            autoplayPropTrue : this.autoplayPropTrue,
            posterProp : this.posterProp,
            posterPropNone : this.posterPropNone,
            controlsPropFalse : this.controlsPropFalse,
            controlsPropTrue : this.controlsPropTrue,
            loopPropFalse : this.loopPropFalse,
            loopPropTrue : this.loopPropTrue,
            loopPropNone : this.loopPropNone,
            starttimeProp : this.starttimeProp,
            directionPropAuto : this.directionPropAuto,
            directionPropVertical : this.directionPropVertical,
            directionPropHorizontal : this.directionPropHorizontal,
            directionPropAdapt : this.directionPropAdapt,
            directionPropNone : this.directionPropNone,
            speedProp : this.speedProp,
            speedPropNone : this.speedPropNone,
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
        this.focusablePropTrue = this.$element("focusablePropTrue").getInspector()
        this.focusablePropFalse = this.$element("focusablePropFalse").getInspector()
        this.dataProp = this.$element("dataProp").getInspector()
        this.dataPropNone = this.$element("dataPropNone").getInspector()
        this.forPropNull = this.$element("forPropNull").getInspector()
        this.forPropOne = this.$element("forPropOne").getInspector()
        this.forPropThree = this.$element("forPropThree").getInspector()
        this.ifPropTrue = this.$element("ifPropTrue").getInspector()
        this.showPropTrue = this.$element("showPropTrue").getInspector()
        this.showPropFalse = this.$element("showPropFalse").getInspector()
        this.mutedPropFalse = this.$element("mutedPropFalse").getInspector()
        this.mutedPropTrue = this.$element("mutedPropTrue").getInspector()
        this.srcProp = this.$element("srcProp").getInspector()
        this.srcPropNone = this.$element("srcPropNone").getInspector()
        this.autoplayPropFalse = this.$element("autoplayPropFalse").getInspector()
        this.autoplayPropTrue = this.$element("autoplayPropTrue").getInspector()
        this.posterProp = this.$element("posterProp").getInspector()
        this.posterPropNone = this.$element("posterPropNone").getInspector()
        this.controlsPropFalse = this.$element("controlsPropFalse").getInspector()
        this.controlsPropTrue = this.$element("controlsPropTrue").getInspector()
        this.loopPropFalse = this.$element("loopPropFalse").getInspector()
        this.loopPropTrue = this.$element("loopPropTrue").getInspector()
        this.loopPropNone = this.$element("loopPropNone").getInspector()
        this.starttimeProp = this.$element("starttimeProp").getInspector()
        this.directionPropAuto = this.$element("directionPropAuto").getInspector()
        this.directionPropVertical = this.$element("directionPropVertical").getInspector()
        this.directionPropHorizontal = this.$element("directionPropHorizontal").getInspector()
        this.directionPropAdapt = this.$element("directionPropAdapt").getInspector()
        this.directionPropNone = this.$element("directionPropNone").getInspector()
        this.speedProp = this.$element("speedProp").getInspector()
        this.speedPropNone = this.$element("speedPropNone").getInspector()
    },
}
