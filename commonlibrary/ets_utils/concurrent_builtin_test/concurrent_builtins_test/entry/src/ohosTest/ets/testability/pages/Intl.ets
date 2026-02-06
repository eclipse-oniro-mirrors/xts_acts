import taskpool from '@ohos.taskpool';
import { intl } from '@kit.LocalizationKit';

// 用例 0100：Intl.Collator()
@Concurrent
export function testIntlCollator_0100() {
  let TAG = 'testIntlCollator_0100';
  try {
    let intl = Intl.Collator();
    if (!(intl !== undefined && intl !== null)) {
      throw new Error(`${TAG} intl is null or undefined`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 用例 0200：Intl.Collator(locales)
@Concurrent
export function testIntlCollator_0200() {
  let TAG = 'testIntlCollator_0200';
  try {
    let locales = 'de';
    let intl = Intl.Collator(locales);
    if (!(intl !== undefined && intl !== null)) {
      throw new Error(`${TAG} intl is null or undefined`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 用例 0500：Intl.Collator(locales, { usage: 'sort' })
@Concurrent
export function testIntlCollator_0500() {
  let TAG = 'testIntlCollator_0500';
  try {
    let locales = 'de';
    let options: Intl.CollatorOptions = {
      usage: 'sort'
    }
    let intl = Intl.Collator(locales, options);
    if (!(intl !== undefined && intl !== null)) {
      throw new Error(`${TAG} intl is null or undefined`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 用例 1900：new Intl.Collator(locales, options)
@Concurrent
export function testIntlCollator_1900() {
  let TAG = 'testIntlCollator_1900';
  try {
    let locales = 'de';
    let options: Intl.CollatorOptions = {
      usage: 'sort',
      localeMatcher: 'lookup',
      numeric: false,
      caseFirst: 'lower',
      sensitivity: 'case',
      ignorePunctuation: true
    }
    let intl = new Intl.Collator(locales, options);
    if (!(intl !== undefined && intl !== null)) {
      throw new Error(`${TAG} intl is null or undefined`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 用例 2800：非法 usage 参数，抛出异常
@Concurrent
export function testIntlCollator_2800() {
  let TAG = 'testIntlCollator_2800';
  try {
    let locales = 'de';
    let options: Intl.CollatorOptions  = { usage: 'test' };
    let intl = Intl.Collator(locales, options);
    throw new Error(`${TAG} should throw error`);
  } catch (err) {
    if (err.message !== 'getStringOption failed') {
      throw new Error(`${TAG} error message mismatch`);
    }
  }
}

// 用例 6300：compare 接口
@Concurrent
export function testIntlCompare_6300() {
  let TAG = 'testIntlCompare_6300';
  try {
    const enCollator = new Intl.Collator('en');
    let ret = enCollator.compare('z', 'a');
    if (ret !== 1) {
      throw new Error(`${TAG} compare result mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 用例 7200：resolvedOptions 接口
@Concurrent
export function testIntlResolvedOptions_7200() {
  let TAG = 'testIntlResolvedOptions_7200';
  try {
    const collator = new Intl.Collator();
    let options = collator.resolvedOptions();
    if (options.locale !== 'en-US' || options.numeric !== false || options.sensitivity !== 'variant') {
      throw new Error(`${TAG} resolvedOptions mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 用例 8700：Intl.DateTimeFormat()
@Concurrent
export function testIntlDateTimeFormat_8700() {
  let TAG = 'testIntlDateTimeFormat_8700';
  try {
    let intl = new Intl.DateTimeFormat();
    if (!(intl instanceof Intl.DateTimeFormat)) {
      throw new Error(`${TAG} intl is not instance of DateTimeFormat`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 用例 8800：Intl.DateTimeFormat('de')
@Concurrent
export function testIntlDateTimeFormat_8800() {
  let TAG = 'testIntlDateTimeFormat_8800';
  try {
    let locales = 'de';
    let intl = new Intl.DateTimeFormat(locales);
    if (intl.resolvedOptions().locale !== 'de') {
      throw new Error(`${TAG} locale mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testNumberFormatConstructorNew0009() {
  const TAG = 'testNumberFormatConstructorNew0009';
  try {
    let locales = 'zh';
    let options: Intl.NumberFormatOptions = {
      localeMatcher: 'lookup'
    }
    let numberFormat = new Intl.NumberFormat(locales, options);
    if (numberFormat instanceof Intl.NumberFormat !== true) {
      throw new Error(`${TAG} locale mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testPluralRulesConstructor0006() {
  const TAG = 'testPluralRulesConstructor0006';
  try {
    let locales = [];
    let pluralRules = new Intl.PluralRules(locales);
    if (pluralRules.toString() !== '[object Intl.PluralRules]') {
      throw new Error(`${TAG} locale mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

@Concurrent
export function testCollatorSupportedLocalesOf0009() {
  const TAG = 'testCollatorSupportedLocalesOf0009';
  try {
    let locales = 'de-ID';
    let options: Intl.CollatorOptions = {
      localeMatcher: 'lookup'
    };
    const result = Intl.Collator.supportedLocalesOf(locales, options);
    if (Array.isArray(result) !== true) {
      throw new Error(`${TAG} locale mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed, error: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}



@Concurrent
export function testIntlRelativeTimeFormatCtor() {
  const TAG = 'testIntlRelativeTimeFormatCtor';
  try {
    const rtf = new Intl.RelativeTimeFormat('de');
    if (rtf.constructor.name !== 'RelativeTimeFormat') {
      throw new Error(`${TAG} constructor.name mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

@Concurrent
export function testIntlRelativeTimeFormatFormat() {
  const TAG = 'testIntlRelativeTimeFormatFormat';
  try {
    const rtf = new Intl.RelativeTimeFormat('en', {
      localeMatcher: 'lookup',
      numeric: 'auto',
      style: 'long'
    });
    const out = rtf.format(1, 'year');
    if (out !== 'next year') {
      throw new Error(`${TAG} format mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}


@Concurrent
export function testIntlRelativeTimeFormatFormatToParts() {
  const TAG = 'testIntlRelativeTimeFormatFormatToParts';
  try {
    const rtf = new Intl.RelativeTimeFormat('en', {
      localeMatcher: 'lookup',
      numeric: 'auto',
      style: 'long'
    });
    const parts = rtf.formatToParts(1, 'year');
    const json = JSON.stringify(parts);
    if (json !== '[{"type":"literal","value":"next year"}]') {
      throw new Error(`${TAG} formatToParts mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}

@Concurrent
export function testIntlRelativeTimeFormatDefault() {
  const TAG = 'testIntlRelativeTimeFormatDefault';
  try {
    const rtf = new Intl.RelativeTimeFormat();
    const out = rtf.format(1, 'day');
    if (out !== 'in 1 day') {
      throw new Error(`${TAG} default format mismatch`);
    }
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error`);
  }
}