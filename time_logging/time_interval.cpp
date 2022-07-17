#include <ctime>
#include <unistd.h>
#include "time_interval.hpp"

void time_interval::time_interval(std::time_t begin) {
    this->open = true;
    this->begin = new std::time_t;
    *this->begin = begin;
    this->end = NULL;
}

struct simple_time time_interval::get_interval() {
    struct simple_time s_t;
    double diff_seconds;
    if (this->open) {
        std::time_t now = time(NULL);
        diff_seconds = difftime(this->end, now);
    }
    else {
        diff_seconds = difftime(this->end, this->begin);
    }
    int seconds = int(diff_seconds);
    int minutes = seconds/60;
    int hours = minutes/60;
    s_t.seconds = seconds%60;
    s_t.minutes = minutes%60;
    s_t.hours = hours;
    return s_t;
};

void time_interval::close_interval(std::time_t end) {
    this->end = new std::time_t;
    *this->end = end;
    this->bool = false;
}

bool time_interval::is_open() {
    return this->open;
}
