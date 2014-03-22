package com.kott.shortener

import grails.transaction.Transactional

@Transactional(readOnly = true)
class AnalyticsService {

    def retrieveStats(Set<Mapping> mappings) {
      return [test1: 'someStats', test2: 'someStats']
    }
}
