import { createContext, useContext, useState } from 'react'

const CompareContext = createContext({})

export function CompareProvider({ children }) {
  const [compareList, setCompareList] = useState([])

  function addToCompare(tool) {
    if (compareList.length >= 3) return
    if (compareList.find(t => t.id === tool.id)) return
    setCompareList(prev => [...prev, tool])
  }

  function removeFromCompare(toolId) {
    setCompareList(prev => prev.filter(t => t.id !== toolId))
  }

  function clearCompare() {
    setCompareList([])
  }

  return (
    <CompareContext.Provider value={{ compareList, addToCompare, removeFromCompare, clearCompare }}>
      {children}
    </CompareContext.Provider>
  )
}

export const useCompare = () => useContext(CompareContext)
