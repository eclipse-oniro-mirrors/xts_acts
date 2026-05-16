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
// global
import setDefaultThemeTest from './themeTokens/SetDefaultTheme.test';
import systemThemeTest from './themeTokens/SystemTheme.test';
import withThemeTest from './themeTokens/WithTheme.test';
// components
import alphabetIndexerThemeTest from './components/AlphabetIndexer.test';
import badgeThemeTest from './components/Badge.test';
import buttonThemeTest from './components/Button.test';
import checkboxThemeTest from './components/Checkbox.test';
import checkboxGroupThemeTest from './components/CheckboxGroup.test';
import counterThemeTest from './components/Counter.test';
import datePickerThemeTest from './components/DatePicker.test';
import dividerThemeTest from './components/Divider.test';
import forEachTest from './components/ForEach.test';
import ifThemeTest from './components/If.test';
import lazyForEachTest from './components/LazyForEach.test';
import loadingProgressThemeTest from './components/LoadingProgress.test';
import menuThemeTest from './components/Menu.test';
import menuItemThemeTest from './components/MenuItem.test';
import patternLockThemeTest from './components/PatternLock.test';
import qrCodeThemeTest from './components/QRCode.test';
import radioThemeTest from './components/Radio.test';
import scrollThemeTest from './components/Scroll.test';
import searchThemeTest from './components/Search.test';
import sliderThemeTest from './components/Slider.test';
import swiperThemeTest from './components/Swiper.test';
import textThemeTest from './components/Text.test';
import textClockThemeTest from './components/TextClock.test';
import textInputThemeTest from './components/TextInput.test';
import textPickerThemeTest from './components/TextPicker.test';
import timePickerThemeTest from './components/TimePicker.test';
import toggleThemeTest from './components/Toggle.test'

export default function testsuite() {
  // global tests
  setDefaultThemeTest();
  systemThemeTest();
  withThemeTest();
  // components
  alphabetIndexerThemeTest();
  badgeThemeTest();
  buttonThemeTest();
  checkboxThemeTest()
  checkboxGroupThemeTest();
  counterThemeTest();
  datePickerThemeTest();
  dividerThemeTest();
  forEachTest();
  ifThemeTest();
  lazyForEachTest();
  loadingProgressThemeTest();
  menuThemeTest();
  menuItemThemeTest();
  patternLockThemeTest();
  qrCodeThemeTest();
  radioThemeTest();
  scrollThemeTest();
  searchThemeTest();
  sliderThemeTest();
  swiperThemeTest();
  textThemeTest();
  textClockThemeTest();
  textInputThemeTest();
  textPickerThemeTest();
  timePickerThemeTest();
  toggleThemeTest();
}