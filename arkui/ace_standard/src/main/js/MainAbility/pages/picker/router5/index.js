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

export  default {
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
        focusablePropTrue : null,
        focusablePropFalse : null,
        focusablePropNone : null,
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
        verticalTrue: null,
        verticalFalse: null,
        rangetext:['15', "20", "25"],
        multitext:[["a", "b", "c"], ["e", "f", "g"], ["h", "i"], ["k", "l", "m"]],
        textvalue:'textvalue',
        datevalue:'datevalue',
        timevalue:'timevalue',
        datetimevalue:'datetimevalue',
        multitextvalue:'multitextvalue',
        containsecond:true,
        multitextselect:[1,2,0],
        datetimeselect:'2012-5-6-11-25',
        timeselect:'11:22:30',
        dateselect:'2021-3-2',
        textselect:'2',
        pickerText: null,
        pickerDate: null,
        pickerTime: null,
        pickerDatetime: null,
        pickerMultiText: null
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
            focusablePropTrue : this.focusablePropTrue,
            focusablePropFalse : this.focusablePropFalse,
            focusablePropNone : this.focusablePropNone,
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
            pickerText: this.pickerText,
            pickerDate: this.pickerDate,
            pickerTime: this.pickerTime,
            pickerDatetime: this.pickerDatetime,
            pickerMultiText: this.pickerMultiText
        }
    },

    getCommonPropValues(){

        this.clickEffectPropSmall = this.$element("clickEffectPropSmall").getInspector()
        this.clickEffectPropMedium = this.$element("clickEffectPropMedium").getInspector()
        this.clickEffectPropLarge = this.$element("clickEffectPropLarge").getInspector()
        this.clickEffectPropNone = this.$element("clickEffectPropNone").getInspector()

    }
}
