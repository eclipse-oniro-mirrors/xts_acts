export function fillNum(num) {
    if (num < 10) {
        return '0' + num
    }
    return num.toString()
}

export function getTimeString(time) {
    if (time == -1 || time == undefined) {
        time = 0
    }
    let hour = Math.floor(time % (1000 * 60 * 60 * 24) / (1000 * 60 * 60))
    let minute = Math.floor(time % (1000 * 60 * 60) / (1000 * 60))
    let second = Math.floor(time % (1000 * 60) / 1000)
    if (hour > 0) {
        return `${fillNum(hour)}:${fillNum(minute)}:${fillNum(second)}`
    }
    return `${fillNum(minute)}:${fillNum(second)}`
}