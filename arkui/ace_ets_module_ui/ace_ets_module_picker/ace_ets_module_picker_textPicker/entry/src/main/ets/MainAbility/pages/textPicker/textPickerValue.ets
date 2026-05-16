/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
@Entry
@Component
struct TextPickerValue {
    @State fruits: string[] = ['apple', 'null', 'undefined', 'true', 'false', '1', '1abc', '二十六日']
    build() {
        Column({ space: 8 }) {
            TextPicker({ range: this.fruits, value: $r('app.string.apple') }).canLoop(false)
                .id('TextPicker').textStyle({font: {size: 10, }}).defaultPickerItemHeight(20).height(40)
            TextPicker({ range: this.fruits, value: undefined }).canLoop(false)
                .id('TextPicker1').textStyle({font: {size: 10, }}).defaultPickerItemHeight(20).height(40)
            TextPicker({ range: this.fruits, value: null }).canLoop(false)
                .id('TextPicker2').textStyle({font: {size: 10, }}).defaultPickerItemHeight(20).height(40)
            TextPicker({ range: this.fruits, value: 'apple' }).canLoop(false)
                .id('TextPicker3').textStyle({font: {size: 10, }}).defaultPickerItemHeight(20).height(40)
        }
    }
}